unit acpedidos.services.pedidos;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  RESTRequest4D,
  acpedidos.providers.session,
  acpedidos.model.entidades;

type
  TServicesPedidos = class
  private
  public
    procedure Gravar(Value: TPedidos);
    class function New: TServicesPedidos;
  end;

implementation

{ TServicesPedidos }

procedure TServicesPedidos.Gravar(Value: TPedidos);
var
  LResponse: IResponse;
  lJson: TJSONObject;
begin
  lJson := Value.ToJson;

  LResponse := TRequest.New
    .BaseURL('http://localhost:9002')
    .Resource('pedidos')
    .AddHeader('Content-Type','application/json')
    .Token(TSession.GetInstance.Token)
    .AddBody(lJson.ToString)
    .Post;

  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

class function TServicesPedidos.New: TServicesPedidos;
begin
  Result := Self.Create;
end;

end.
