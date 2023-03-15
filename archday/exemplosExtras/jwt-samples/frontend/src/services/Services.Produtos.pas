unit Services.Produtos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RESTRequest4D, Providers.Session;

type
  TServiceProdutos = class(TDataModule)
    mtProdutos: TFDMemTable;
    mtProdutosid: TIntegerField;
    mtProdutosdescricao: TStringField;
    mtProdutospreco: TLargeintField;
    mtProdutosgrupo: TStringField;
  public
    procedure GetAll;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TServiceProdutos.GetAll;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New
    .BaseURL('http://localhost:9002')
    .Resource('produtos')
    .DataSetAdapter(mtProdutos)
    .Token(TSession.GetInstance.Token)
    .Get;
  if not (LResponse.StatusCode = 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));
end;

end.
