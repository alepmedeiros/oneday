unit acpedidos.provider.session;

interface

type
  TSession = class
  private
    FToken: string;
  public
    property Token: string read FToken write FToken;
    class function GetInstance: TSession;
    class function NewInstance: TObject; override;
  end;

var
  Session: TSession;

implementation

class function TSession.GetInstance: TSession;
begin
  Result := TSession.Create;
end;

class function TSession.NewInstance: TObject;
begin
  if not Assigned(Session) then
    Session := TSession(inherited NewInstance);
  Result := Session;
end;

initialization

finalization
  if Assigned(Session) then
    Session.Free;

end.
