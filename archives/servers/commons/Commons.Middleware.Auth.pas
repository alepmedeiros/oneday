unit Commons.Middleware.Auth;

interface

uses Horse, System.Classes, System.SysUtils, Horse.Commons, RESTRequest4D, System.JSON;

function AuthHandler: THorseCallback;
procedure Authorize(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);

implementation

function AuthHandler: THorseCallback;
begin
  Result := Authorize;
end;

procedure Authorize(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LResponse: IResponse;
  LToken: string;
  LError: string;
begin
  LToken := Req.Headers['Authorization'].Replace('bearer ', '', [rfIgnoreCase]);
  if LToken.Trim.IsEmpty then
  begin
    Res.Send(TJSONObject.Create.AddPair('error', 'Token inválido')).Status(401);
    raise EHorseCallbackInterrupted.Create;
  end;

  try
    LResponse := TRequest.New.BaseURL('http://localhost:9003/authorize').Token(LToken).Get;
  except
    on E:Exception do
    begin
      Res.Send(TJSONObject.Create.AddPair('error', E.Message)).Status(404);
      raise EHorseCallbackInterrupted.Create;
    end;
  end;

  if LResponse.StatusCode <> 204 then
  begin
    LError := LResponse.JSONValue.GetValue<string>('error', 'Token inválido');
    Res.Send(TJSONObject.Create.AddPair('error', LError)).Status(401);
    raise EHorseCallbackInterrupted.Create;
  end;
  Next;
end;

end.
