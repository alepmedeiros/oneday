unit Services.Auth;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, JOSE.Core.JWT, System.DateUtils, JOSE.Core.Builder, System.NetEncoding,
  JOSE.Core.JWK, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TServicesAuth = class(TDataModule)
    Connection: TFDConnection;
    qryUsuarios: TFDQuery;
    qryUsuariosid: TFDAutoIncField;
    qryUsuarioslogin: TStringField;
    qryUsuariossenha: TStringField;
    qryUsuariosnome: TStringField;
    qryKeys: TFDQuery;
    qryKeysid: TFDAutoIncField;
    qryKeyspublic_key: TStringField;
    qryKeysprivate_key: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    FToken: TJWT;
    FPublicKey: string;
    FPrivateKey: string;
    function GetAccessToken: string;
    function GetPublicKey(const AAuthorization: string): string;
    procedure GenerateKeys;
    procedure SaveKeys;
  public
    function Login(const AUser: TJSONObject): Boolean;
    function GenerateToken: TJSONObject;
    function LoadToken(const AAuthorization: string): Boolean;
    function TokenExpired: Boolean;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}


procedure TServicesAuth.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FToken) then
    FToken.Free;
end;

procedure TServicesAuth.GenerateKeys;
var
  LTimestamp: Int64;
begin
  LTimestamp := DateTimeToUnix(Now);
  FPublicKey := Format('%d:%s', [LTimestamp, qryUsuarioslogin.AsString]);
  FPrivateKey := Format('%d:%s:%s', [LTimestamp, qryUsuarioslogin.AsString, qryUsuariosSenha.AsString]);
end;

function TServicesAuth.GenerateToken: TJSONObject;
begin
  GenerateKeys;
  SaveKeys;
  Result := TJSONObject.Create.AddPair('token', GetAccessToken)
end;

function TServicesAuth.GetAccessToken: string;
var
  LToken: TJWT;
begin
  LToken := TJWT.Create;
  try
    LToken.Claims.Issuer := 'Dev Software Company';
    LToken.Claims.Expiration := Now + (OneMinute * 15);
    LToken.Claims.NotBefore := Now - OneMinute * 5;
    LToken.Claims.IssuedAt := Now;
    LToken.Claims.Subject := qryUsuariosid.AsString;
    LToken.Claims.SetClaimOfType('access_key', FPublicKey);
    LToken.Claims.SetClaimOfType('user', qryUsuarioslogin.AsString);
    LToken.Claims.SetClaimOfType('name', qryUsuariosnome.AsString);
    Result := TJOSE.SHA256CompactToken(FPrivateKey, LToken);
  finally
    LToken.Free;
  end;
end;

function TServicesAuth.GetPublicKey(const AAuthorization: string): string;
var
  LPayload: TJSONObject;
  LAccessToken: TArray<string>;
begin
  LAccessToken := AAuthorization.Split(['.']);
  LPayload := TJSONObject.ParseJSONValue(TNetEncoding.Base64.Decode(LAccessToken[1])) as TJSONObject;
  try
    Result := LPayload.GetValue<string>('access_key', EmptyStr);
  finally
    LPayload.Free;
  end;
end;

function TServicesAuth.LoadToken(const AAuthorization: string): Boolean;
var
  LKey: TJWK;
begin
  Result := True;
  qryKeys.Close;
  qryKeys.ParamByName('public_key').AsString := GetPublicKey(AAuthorization);
  qryKeys.Open();
  if qryKeys.IsEmpty then
    Exit(False);
  LKey := TJWK.Create(qryKeysprivate_key.AsString);
  FToken := TJOSE.Verify(LKey, AAuthorization);
  if Assigned(FToken) and not FToken.Verified then
    Exit(False);
end;

function TServicesAuth.Login(const AUser: TJSONObject): Boolean;
begin
  qryUsuarios.ParamByName('login').AsString := AUser.GetValue<string>('login', EmptyStr);
  qryUsuarios.ParamByName('senha').AsString := AUser.GetValue<string>('senha', EmptyStr);
  qryUsuarios.Open();
  Result := not qryUsuarios.IsEmpty;
end;

procedure TServicesAuth.SaveKeys;
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(Self);
  try
    LQuery.Connection := Connection;
    LQuery.SQL.Text := 'insert into usuario_key (public_key, private_key) values (:public_key, :private_key)';
    LQuery.ParamByName('public_key').AsString := FPublicKey;
    LQuery.ParamByName('private_key').AsString := FPrivateKey;
    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

function TServicesAuth.TokenExpired: Boolean;
begin
  Result := False;
  if not FToken.Claims.HasExpiration then
    Exit(True);
  if FToken.Claims.Expiration < Now then
    Exit(True);
end;

end.
