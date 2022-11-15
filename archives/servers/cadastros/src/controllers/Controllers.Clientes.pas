unit Controllers.Clientes;

interface

uses Horse, Services.Clientes, System.JSON, DataSet.Serialize;

procedure Registry(App: THorse);

implementation

procedure DoList(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesClientes;
begin
  LService := TServicesClientes.Create(nil);
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray);
  finally
    LService.Free;
  end;
end;

procedure Registry(App: THorse);
begin
  App.Get('/clientes', DoList);
end;

end.
