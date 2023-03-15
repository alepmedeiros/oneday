unit acpedidos.services.login;

interface

uses
  System.SysConst,
  System.Classes,
  System.JSON,
  RESTRequest4D,
  acpedidos.model.entidades,
  acpedidos.providers.session,
  System.SysUtils;

type
  TServicesLogin = class
  private
  public
    function login(aUsuario: String; aSenha: String): Boolean;
    procedure Gravar(Value: Tusuario);

    class function New: TServicesLogin;
  end;

implementation

{ TServicesLogin }

procedure TServicesLogin.Gravar(Value: Tusuario);
var
  lResp: iResponse;
  lJSON: TJSONObject;
begin
  lJson := Value.ToJSON;
  lResp := TRequest.New.BaseURL('http://localhost:9000')
    .Resource('usuarios')
    .AddHeader('Content-Type', 'application/json')
    .AddBody(lJSON.ToString)
    .Post;
  if not(lResp.StatusCode = 200) then
    raise Exception.Create(lResp.JSONValue.GetValue<string>('error'));
end;

function TServicesLogin.login(aUsuario: String; aSenha: String): Boolean;
var
  lResp: iResponse;
begin
  lResp := TRequest.New.BaseURL('http://localhost:9000/usuarios')
    .Resource('login').AddBody(TJSONObject.Create.AddPair('usuario', aUsuario)
    .AddPair('senha', aSenha)).Post;
  if not(lResp.StatusCode = 200) then
    Result := False;
//    raise Exception.Create(lResp.JSONValue.GetValue<string>('error'));
  Tsession.GetInstance.Token := lResp.JSONValue.GetValue<string>('token');
  Result := True;
end;

class function TServicesLogin.New: TServicesLogin;
begin
  Result := Self.Create;
end;

end.
