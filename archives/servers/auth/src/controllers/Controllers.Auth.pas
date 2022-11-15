unit Controllers.Auth;

interface

uses Horse, Services.Auth, System.JSON, DataSet.Serialize, System.Classes, System.SysUtils;

procedure Registry(App: THorse);

implementation

procedure DoLogin(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesAuth;
begin
  LService := TServicesAuth.Create(nil);
  try
    if not LService.Login(Req.Body<TJSONObject>) then
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('error', 'Usuário ou senhas inválidos!')).Status(404)
    else
      Res.Send<TJSONObject>(LService.GenerateToken);
  finally
    LService.Free;
  end;
end;

procedure DoAuthorize(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesAuth;
  LAuthorization: string;
begin
  LService := TServicesAuth.Create(nil);
  try
    LAuthorization := Req.Headers['Authorization'].Replace('bearer ', EmptyStr, [rfIgnoreCase]);
    if LAuthorization.Trim.IsEmpty then
    begin
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('error', 'Token inválido!')).Status(401);
      Exit;
    end;
    if not LService.LoadToken(LAuthorization) then
    begin
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('error', 'Token inválido!')).Status(401);
      Exit;
    end;
    if LService.TokenExpired then
    begin
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('error', 'Token expirado!')).Status(401);
      Exit;
    end;
    Res.Status(204);
  finally
    LService.Free;
  end;
end;

procedure Registry(App: THorse);
begin
  App.Post('/login', DoLogin);
  App.Get('/authorize', DoAuthorize);
end;

end.
