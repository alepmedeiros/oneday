unit Services.Clientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TServicesClientes = class(TDataModule)
    Connection: TFDConnection;
    qryClientes: TFDQuery;
    qryClientesid: TFDAutoIncField;
    qryClientesnome: TStringField;
    qryClientessobrenome: TStringField;
    qryClientesemail: TStringField;
    qryClientestelefone: TStringField;
    qryClienteslocalidade: TStringField;
  public
    function ListAll: TFDQuery;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function TServicesClientes.ListAll: TFDQuery;
begin
  qryClientes.Open;
  Result := qryClientes;
end;

end.
