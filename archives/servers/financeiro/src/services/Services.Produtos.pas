unit Services.Produtos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TServicesProdutos = class(TDataModule)
    Connection: TFDConnection;
    qryProdutos: TFDQuery;
    qryProdutosid: TFDAutoIncField;
    qryProdutosdescricao: TStringField;
    qryProdutospreco: TLargeintField;
    qryProdutosgrupo: TStringField;
  public
    function ListAll: TFDQuery;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function TServicesProdutos.ListAll: TFDQuery;
begin
  qryProdutos.Open;
  Result := qryProdutos;
end;

end.
