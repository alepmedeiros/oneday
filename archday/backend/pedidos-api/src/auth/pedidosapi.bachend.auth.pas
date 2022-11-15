unit pedidosapi.bachend.auth;

interface

uses
  System.SysUtils,
  System.JSON,
  Horse,
  Horse.JWT,
  Horse.Commons,
  pedidosapi.bachend.auth.interfaces,
  pedidosapi.bachend.auth.httpclient;

function AuthHandler: THorseCallback;
procedure Middleware(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

function AuthHandler: THorseCallback;
begin
  Result := Middleware;
end;

procedure Middleware(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  lToken: String;
begin
  lToken := Req.Headers[LowerCase('Authorization')].Replace('bearer ', '', [rfIgnoreCase]);
  if lToken.Trim.IsEmpty then
  begin
    try
      THttpClient.New('http://localhost:9000').Token(lToken).Get('autorizar');
      Next;
      Exit;
    except
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('error','Token inválido')).Status(401);
      raise EHorseCallbackInterrupted.Create;
    end;
  end;
  Res.Send<TJSONObject>(TJSONObject.Create.AddPair('error','Token inválido')).Status(401);
  raise EHorseCallbackInterrupted.Create;
  Next;
end;

end.
