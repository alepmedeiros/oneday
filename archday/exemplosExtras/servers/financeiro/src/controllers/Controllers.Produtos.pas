unit Controllers.Produtos;

interface

uses Horse, Services.Produtos, System.JSON, DataSet.Serialize;

procedure Registry(App: THorse);

implementation

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesProdutos;
begin
  LService := TServicesProdutos.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray);
  finally
    LService.Free;
  end;
end;

procedure Registry(App: THorse);
begin
  App.Get('/produtos', DoList);
end;

end.
