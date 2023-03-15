unit acpedidos.services.login;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  RESTRequest4D,
  acpedidos.provider.session,
  acpedidos.model.entity;

type
  TServicesLogin = class
  private
  public
    procedure Login(aUsuario: String; aSenha: String);
    procedure Gravar(Value: TUsuario);

    class function New: TServicesLogin;
  end;

implementation

{ TServicesLogin }

procedure TServicesLogin.Gravar(Value: TUsuario);
var
  LResponse: IResponse;
  lJson: TJSONObject;
begin
  lJson := Value.ConvertToJson;

  LResponse := TRequest.New
    .BaseURL('http://localhost:9000')
    .Resource('usuarios')
    .AddHeader('Content-Type','application/json')
    .AddBody(lJson.ToString)
    .Post;

  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

procedure TServicesLogin.Login(aUsuario, aSenha: String);
var
  lResponse: IResponse;
begin
  lResponse := TRequest.New
    .BaseURL('http://localhost:9000/usuarios')
    .Resource('login')
    .AddBody(TJSONObject.Create.AddPair('usuario', AUsuario).AddPair('senha', ASenha))
    .Post;
  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
  TSession.GetInstance.Token := LResponse.JSONValue.GetValue<string>('token');
end;

class function TServicesLogin.New: TServicesLogin;
begin
  Result := Self.Create;
end;

end.
