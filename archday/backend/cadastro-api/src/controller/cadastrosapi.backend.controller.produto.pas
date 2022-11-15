unit cadastrosapi.backend.controller.produto;

interface

uses
  Horse,
  System.SysUtils,
  System.Generics.Collections,
  System.JSON,
  cadastrosapi.backend.services,
  cadastrosapi.backend.model.entity.categoria,
  cadastrosapi.backend.model.entity.produto,
  cadastrosapi.backend.dto.produto,
  cadastrosapi.backend.dto.categoria,
  cadastrosapi.backend.utils;

procedure Registery(App: THorse);

implementation

procedure ListarTodos(Req: THorseRequest; Res: THorseResponse);
var
  lProduto: TProduto;
  lCategoria: TCategoriaDTO;
  lDTO: TObjectList<TProdutoDTO>;
begin
  lDTO:= TObjectList<TProdutoDTO>.Create;
  for lProduto in TServices<TProduto>.New.FindAll do
  begin
    lCategoria := TServices<TCategoria>.New.Find(lProduto.IdCategoria).Convert;
    lDto.Add(lProduto.Convert(lCategoria));
  end;
  Res.Send<TJSONArray>(TProdutoDTO.New.ListToJsonArray(lDTO));
end;

procedure ListarPorCodigo(Req: THorseRequest; Res: THorseResponse);
var
  lDTO: TProdutoDTO;
  lProduto: TProduto;
begin
  lProduto := TServices<TProduto>.New.Find(Req.Params['id'].ToInteger);
  lDTO := lProduto.Convert(TServices<TCategoria>.New.Find(lProduto.IdCategoria).Convert);
  Res.Send<TJSONObject>(lDTO.ToJson);
end;

procedure ListarPorCategoria(Req: THorseRequest; Res: THorseResponse);
var
  lProdutos: System.Generics.Collections.TObjectList<TProduto>;
  lProduto: TProduto;
  ldto: TObjectList<TProdutoDTO>;
  lCategoria: TCategoriaDTO;
begin
  lCategoria := TServices<TCategoria>.New.FindWhere('descricao', Req.Params['categoria']).Convert;

  lProdutos := TServices<TProduto>.New.FindWhere('idcategoria',lCategoria.Id);

  lDTO := TObjectList<TProdutoDTO>.Create;
  try
    for lProduto in lProdutos do
      lDTO.Add(lProduto.Convert(lCategoria));
    Res.Send<TJSONArray>(TProdutoDTO.New.ListToJsonArray(lDTO));
  finally
    lDTO.Free;
  end;
end;

procedure NovoProduto(Req: THorseRequest; Res: THorseResponse);
var
  lProduto: TProdutoDTO;
  lCategoria: TCategoriaDTO;
  lJson: TJSONObject;
begin
  lJson := Req.Body<TJSONObject>;
  lCategoria := TServices<TCategoria>.New.FindWhere('descricao', lJson.GetValue<String>('categoria')).Convert;
  lJson.RemovePair('categoria');
  ljson.AddPair('categoria',lCategoria.ToJson);

  Res.Send<TJSONObject>(
    TServices<TProduto>
      .New
      .Insert(lProduto
                .JsonToObject(lJson.ToString)
                .Convert)
      .Convert(lCategoria)
      .ToJson);
end;

procedure ApagarProduto(Req: THorseRequest; Res: THorseResponse);
begin
  try
    TServices<TProduto>.New.Delete(Req.Params['id']);
    Res.Status(202);
  except
    Res.Status(404);
  end;
end;

procedure Registery(App: THorse);
begin
  App.Get('/produtos', ListarTodos);
  App.Get('/produtos/:id', ListarPorCodigo);
  App.Get('/produtos/categoria/:categoria', ListarPorCategoria);
  App.Post('/produtos', NovoProduto);
  App.Delete('/produtos/apagar/:id',ApagarProduto);
end;

end.
