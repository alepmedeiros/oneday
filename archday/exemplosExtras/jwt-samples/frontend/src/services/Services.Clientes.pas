unit Services.Clientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RESTRequest4D, Providers.Session;

type
  TServiceClientes = class(TDataModule)
    mtClientes: TFDMemTable;
    mtClientesid: TIntegerField;
    mtClientesnome: TStringField;
    mtClientessobrenome: TStringField;
    mtClientesemail: TStringField;
    mtClientestelefone: TStringField;
    mtClienteslocalidade: TStringField;
  public
    procedure GetAll;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TServiceClientes.GetAll;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL('http://localhost:9001')
    .Resource('clientes')
    .DataSetAdapter(mtClientes)
    .Token(TSession.GetInstance.Token)
    .Get;
  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

end.
