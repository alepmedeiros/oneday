unit acpedidos.providers.session;

interface

type
  Tsession = class
  private
    FToken: String;
  public
    property Token: String read FToken write FToken;
    class function GetInstance: TSession;
    class function NewInstance: TObject; override;
  end;

var
  Session: TSession;

implementation

{ Tsession }

class function Tsession.GetInstance: TSession;
begin
  Result := Tsession.Create;
end;

class function Tsession.NewInstance: TObject;
begin
  if not Assigned(Session) then
    Session := Tsession(inherited NewInstance);
  Result := Session;
end;

initialization

finalization
  if Assigned(Session) then
    Session.Free;

end.
