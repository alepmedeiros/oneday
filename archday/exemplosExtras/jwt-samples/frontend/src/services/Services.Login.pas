unit Services.Login;

interface

uses
  System.SysUtils, System.Classes, RESTRequest4D, System.JSON, Providers.Session;

type
  TServiceLogin = class(TDataModule)
  public
    procedure Login(const AUsuario, ASenha: string);
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TServiceLogin.Login(const AUsuario, ASenha: string);
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL('http://localhost:9003')
    .Resource('login')
    .AddBody(TJSONObject.Create.AddPair('login', AUsuario).AddPair('senha', ASenha))
    .Post;
  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
  TSession.GetInstance.Token := LResponse.JSONValue.GetValue<string>('token');
end;

end.
