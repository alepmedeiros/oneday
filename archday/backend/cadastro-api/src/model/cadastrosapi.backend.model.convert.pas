unit cadastrosapi.backend.model.convert;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  cadastrosapi.backend.dto.produto,
  cadastrosapi.backend.model.entity.produto,
  cadastrosapi.backend.dto.categoria,
  cadastrosapi.backend.model.entity.categoria;

function Converter(aProduto: TProduto): TProdutoDTO; overload;
function Converter(aDTO: TProdutoDTO): TProduto; overload;
function Converter(aListProduto: TObjectList<TProduto>)
  : TObjectList<TProdutoDTO>; overload;
function Converter(aListDTO: TObjectList<TProdutoDTO>)
  : TObjectList<TProduto>; overload;

function Converter(aCategoria: TCategoria): TCategoriaDTO; overload;
function Converter(aDTO: TCategoriaDTO): TCategoria; overload;
function Converter(aListCategoria: TObjectList<TCategoria>)
  : TObjectList<TCategoriaDTO>; overload;
function Converter(aListDTO: TObjectList<TCategoriaDTO>)
  : TObjectList<TCategoria>; overload;

implementation

function Converter(aProduto: TProduto): TProdutoDTO;
var
  lDTO: TProdutoDTO;
begin
  lDTO:= TProdutoDTO.New;

  lDTO.Id := aProduto.Id;
  lDto.Descricao := aProduto.Descricao;
  lDto.Preco := aProduto.Preco;
  lDto.Categoria := aProduto.IdCategoria;

  Result := lDTO;
end;

function Converter(aDTO: TProdutoDTO): TProduto;
var
  lProduto: TProduto;
begin
  lProduto:= TProduto.New;

  lProduto.Id := aDTO.Id;
  lProduto.Descricao := aDTO.Descricao;
  lProduto.Preco := aDTO.Preco;
  lProduto.IdCategoria := aDTO.Categoria;

  Result := lProduto;
end;

function Converter(aListProduto: TObjectList<TProduto>)
  : TObjectList<TProdutoDTO>;
var
  lProduto: TProduto;
begin
  Result := TObjectList<TProdutoDTO>.Create;
  for lProduto in aListProduto do
    Result.Add(Converter(lProduto));
end;

function Converter(aListDTO: TObjectList<TProdutoDTO>): TObjectList<TProduto>;
var
  lProdutoDTO: TProdutoDTO;
begin
  Result := TObjectList<TProduto>.Create;
  for lProdutoDTO in aListDTO do
    Result.Add(Converter(lProdutoDTO));
end;

function Converter(aCategoria: TCategoria): TCategoriaDTO;
var
  lDTO: TCategoriaDTO;
begin
  lDTO := TCategoriaDTO.New;
  lDTO.Id := aCategoria.Id;
  lDTO.Descricao := aCategoria.Descricao;

  Result := lDTO;
end;

function Converter(aDTO: TCategoriaDTO): TCategoria;
var
  lCategoria: TCategoria;
begin
  lCategoria := TCategoria.New;
  lCategoria.Id := aDTO.Id;
  lCategoria.Descricao := aDTO.Descricao;

  Result := lCategoria;
end;

function Converter(aListCategoria: TObjectList<TCategoria>)
  : TObjectList<TCategoriaDTO>;
var
  lCategoria: TCategoria;
begin
  Result := TObjectList<TCategoriaDTO>.Create;
  for lCategoria in aListCategoria do
    Result.Add(Converter(lCategoria));
end;

function Converter(aListDTO: TObjectList<TCategoriaDTO>)
  : TObjectList<TCategoria>;
var
  lDTO: TCategoriaDTO;
begin
  Result := TObjectList<TCategoria>.Create;
  for lDTO in aListDTO do
    Result.Add(Converter(lDTO));
end;

end.
