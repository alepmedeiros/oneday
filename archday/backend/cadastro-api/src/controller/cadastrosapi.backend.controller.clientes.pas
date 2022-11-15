unit cadastrosapi.backend.controller.clientes;

interface

uses
  Horse,
  System.SysUtils,
  System.JSON,
  System.Generics.Collections,
  cadastrosapi.backend.services,
  cadastrosapi.backend.utils,
  cadastrosapi.backend.dto.endereco,
  cadastrosapi.backend.dto.clientes,
  cadastrosapi.backend.model.entity.pessoas,
  cadastrosapi.backend.model.entity.endereco,
  cadastrosapi.backend.model.entity.clientes,
  cadastrosapi.backend.dto.enumerados;

procedure Registery(App: THorse);

implementation

procedure BuscarPorId(Req: THorseRequest; Res: THorseResponse);
var
  lCliente: TClienteDTO;
  lPessoa: TPessoas;
  lEndereco: System.Generics.Collections.TObjectList<TEndereco>;
begin
  lPessoa := TServices<TPessoas>.New.Find(Req.Params['id'].ToInteger);
  lEndereco := TServices<TEndereco>.New.FindWhere('id_pessoa', Req.Params['id'].ToInteger);
  lCliente := TServices<TClientes>.New.Find(Req.Params['id'].ToInteger).Convert(lPessoa, lEndereco);
  Res.Send<TJSONObject>(lCliente.ToJson);
end;

procedure ListarTodos(Req: THorseRequest; Res: THorseResponse);
var
  lClientes: TObjectList<TClientes>;
  lCliente: TClientes;
  lDTO: TObjectList<TClienteDTO>;
begin
  lDTO:= TObjectList<TClienteDTO>.Create;
  lClientes := TServices<TClientes>.New.FindAll;
  for lCliente in lClientes do
      lDTO.Add(lCliente.Convert(TServices<TPessoas>.New.Find(lCliente.IdPessoa),
        TServices<TEndereco>.New.FindWhere('id_pessoa', lCliente.IdPessoa)));
  Res.Send<TJSONArray>(TClienteDTO.New.ListToJsonArray(lDto));
end;

procedure NovoCliente(Req: THorseRequest; Res: THorseResponse);
var
  lJSON: TJSONObject;
  lArray: TJSONArray;
  lDTO: TClienteDTO;
  lCliente: TClientes;
  lPessoa: TPessoas;
  lEnderecos: TObjectList<TEndereco>;
  lEndereco: TEndereco;
begin
  lDTO := TClienteDTO.New.JsonToObject(Req.Body);

  lCliente := lDTO.Convert(lPessoa, lEnderecos);

  lPessoa := Tservices<TPessoas>.New.Insert(lPessoa);

  lCliente.IdPessoa := lPessoa.Id;
  TServices<TClientes>.New.Insert(lCliente);

  for lEndereco in lEnderecos do
  begin
    lEndereco.IdPessoa := lPessoa.Id;
    TServices<TEndereco>.New.Insert(lEndereco);
  end;

  lDTO.Id := lPessoa.Id;
  res.Send<TJSONObject>(lDTO.ToJson);
end;

procedure PagarCliente(Req: THorseRequest; Res: THorseResponse);
begin
  try
    TServices<TPessoas>.New.Delete(Req.Params['id']);
    Res.Status(204);
  except
    Res.Status(400);
  end;
end;

procedure Registery(App: THorse);
begin
  App.Get('/clientes/:id', BuscarPorId);
  App.Get('/clientes', ListarTodos);
  App.Post('/clientes', NovoCliente);
  App.Delete('/clientes/:id/apagar', PagarCliente);
end;

end.
