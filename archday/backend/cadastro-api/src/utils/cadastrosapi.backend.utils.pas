unit cadastrosapi.backend.utils;

interface

uses
  System.Json,
  System.SysUtils,
  System.TypInfo,
  GBJSON.Interfaces,
  System.Generics.Collections,
  cadastrosapi.backend.model.entity.produto,
  cadastrosapi.backend.dto.produto,
  cadastrosapi.backend.dto.categoria,
  cadastrosapi.backend.model.entity.categoria,
  cadastrosapi.backend.dto.clientes,
  cadastrosapi.backend.model.entity.clientes,
  cadastrosapi.backend.dto.enumerados,
  cadastrosapi.backend.model.entity.pessoas,
  cadastrosapi.backend.model.entity.endereco,
  cadastrosapi.backend.dto.endereco,
  cadastrosapi.backend.dto.usuario,
  cadastrosapi.backend.model.entity.usuarios;

type
  TTipoPessoaHelper = record helper for TTipoPessoa
    function ToEnum(Value: String): TTipoPessoa;
    function ToString: String;
  end;

  TTipoEnderecoHelper = record helper for TTipoEndereco
    function ToEnum(Value: String): TTipoEndereco;
    function ToString: String;
  end;

  // TObjectList<T: Class, constructor> = class
  // (System.Generics.Collections.TObjectList<T>)
  // function ToJsonArray: TJSONArray;
  // end;

  TProdutoDTOHelper = class helper for TProdutoDTO
    function Convert(aCategoria: TCategoriaDTO): TProduto; overload;
    function Convert: TProduto; overload;
    function ToJson: TJSONObject;
    function JsonToObject(Value: String): TProdutoDTO;
    function JsonArrayToList(Value: String): TObjectList<TProdutoDTO>;
    function ListToJsonArray(Value: TObjectList<TProdutoDTO>): TJSONArray;
  end;

  TProdutoHelper = class helper for TProduto
    function Convert(aCategoria: TCategoriaDTO): TProdutoDTO; overload;
    function ToJson: TJSONObject;
    procedure JsonToObject(Value: String);
  end;

  TCategoriaDTOHelper = class helper for TCategoria
    function Convert: TCategoriaDTO; overload;
    function Convert(aList: TObjectList<TCategoria>)
      : TObjectList<TCategoriaDTO>; overload;
    function ToJson: TJSONObject;
  end;

  TCategoriaHelper = class helper for TCategoriaDTO
    function Convert: TCategoria; overload;
    function Convert(aList: TObjectList<TCategoriaDTO>)
      : TObjectList<TCategoria>; overload;
    function ToJson: TJSONObject;
    function JsonToObject(Value: String): TCategoriaDTO;
    function ListToJsonArray(Value: TObjectList<TCategoriaDTO>): TJSONArray;
    function JsonArrayToList(Value: String): TObjectList<TCategoriaDTO>;
  end;

  TClientesDTOHelper = class helper for TClienteDTO
    function Convert(var aPessoa: TPessoas;
      var aEndereco: TObjectList<TEndereco>): TClientes;
    function ToClientes: TClientes; overload;
    function ToPessoas: TPessoas; overload;
    function ToEndereco: TObjectList<TEndereco>;
    function ToJson: TJSONObject;
    function JsonToObject(Value: String): TClienteDTO;
    function JsonArrayToList(Value: String): TObjectList<TClienteDTO>;
    function ListToJsonArray(Value: TObjectList<TClienteDTO>): TJSONArray;
  end;

  TClientesHelper = class helper for TClientes
    function Convert(aPessoa: TPessoas; aEndereco: TObjectList<TEndereco>)
      : TClienteDTO;
  end;

  TEnderecoDTOHelper = class helper for TEnderecoDTO
    function Convert: TEndereco;
  end;

  TEnderecoHelper = class helper for TEndereco
    function Convert: TEnderecoDTO; overload;
    function Convert(aLista: TObjectList<TEndereco>)
      : TObjectList<TEnderecoDTO>; overload;
  end;

  TUsuarioDTOHelper = class helper for TUsuarioDTO
    function Convert(var aPessoa: TPessoas): TUsuarios; overload;
    function ToJson: TJSONObject;
    function JsonToObject(Value: String): TUsuarioDTO;
    function ListToJsonArray(Value: TObjectList<TUsuarioDTO>): TJSONArray;
  end;

  TUsuarioHelper = class helper for TUsuarios
    function Convert(aPessoa: TPessoas): TUsuarioDTO;
  end;

implementation

{ TProdutoDTOHelper }

function TProdutoDTOHelper.Convert(aCategoria: TCategoriaDTO): TProduto;
begin
  Result := TProduto.New;
  Result.Id := Self.Id;
  Result.Descricao := Self.Descricao;
  Result.Preco := Self.Preco;
  Result.IdCategoria := aCategoria.Id;
end;

function TProdutoDTOHelper.Convert: TProduto;
begin
  Result := TProduto.New;
  Result.Id := Self.Id;
  Result.Descricao := Self.Descricao;
  Result.Preco := Self.Preco;
  Result.IdCategoria := Self.categoria.Id;
end;

function TProdutoDTOHelper.JsonArrayToList(
  Value: String): TObjectList<TProdutoDTO>;
var
  lJValue: TJSONValue;
  lJSON: TJSONObject;
  lJArray: TJSONArray;
  I: Integer;
begin
  Result := TObjectList<TProdutoDTO>.Create;
  lJValue := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Value), 0);
  lJArray := lJValue as TJSONArray;
  for I := 0 to Pred(lJArray.Size) do
  begin
    lJSON := (lJArray.Get(I) as TJSONObject);
    Result.Add(Self.JsonToObject(lJSON.ToString));
  end;
end;

function TProdutoDTOHelper.JsonToObject(Value: String): TProdutoDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TProdutoDTO>.JsonStringToObject(Value);
end;

function TProdutoDTOHelper.ListToJsonArray(
  Value: TObjectList<TProdutoDTO>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for Self in Value do
    Result.Add(Self.ToJson);
end;

function TProdutoDTOHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TProdutoDTO>.ObjectToJsonObject(Self);
end;

{ TProdutoHelper }

function TProdutoHelper.Convert(aCategoria: TCategoriaDTO): TProdutoDTO;
begin
  Result := TProdutoDTO.New;
  Result.Id := Self.Id;
  Result.Descricao := Self.Descricao;
  Result.Preco := Self.Preco;
  Result.categoria := aCategoria;
end;

procedure TProdutoHelper.JsonToObject(Value: String);
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Self := TGBJSONDefault.Serializer<TProduto>.JsonStringToObject(Value);
end;

function TProdutoHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TProduto>.ObjectToJsonObject(Self);
end;

{ TProdutoObjectList<T> }

// function TObjectList<T>.ToJsonArray: TJSONArray;
// begin
// TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
// Result := TGBJSONDefault.Deserializer<T>.ListToJSONArray(Self);
// end;

{ TCategoriaDTOHelper }

function TCategoriaDTOHelper.Convert: TCategoriaDTO;
begin
  Result := TCategoriaDTO.New;
  Result.Id := Self.Id;
  Result.Descricao := Self.Descricao;
end;

function TCategoriaDTOHelper.Convert(aList: TObjectList<TCategoria>)
  : TObjectList<TCategoriaDTO>;
var
  lCategoria: TCategoria;
begin
  Result := TObjectList<TCategoriaDTO>.Create;
  for lCategoria in aList do
    Result.Add(lCategoria.Convert);
end;

function TCategoriaDTOHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TCategoriaDTO>.ObjectToJsonObject(Self);
end;

{ TCategoriaHelper }

function TCategoriaHelper.Convert: TCategoria;
begin
  Result := TCategoria.New;
  Result.Id := Self.Id;
  Result.Descricao := Self.Descricao;
end;

function TCategoriaHelper.Convert
  (aList: System.Generics.Collections.TObjectList<TCategoriaDTO>)
  : System.Generics.Collections.TObjectList<TCategoria>;
var
  lCategoria: TCategoriaDTO;
begin
  Result := System.Generics.Collections.TObjectList<TCategoria>.Create;
  for lCategoria in aList do
    Result.Add(lCategoria.Convert);
end;

function TCategoriaHelper.JsonArrayToList(
  Value: String): TObjectList<TCategoriaDTO>;
var
  lJValue: TJSONValue;
  lJSON: TJSONObject;
  lJArray: TJSONArray;
  I: Integer;
begin
  Result := TObjectList<TCategoriaDTO>.Create;
  lJValue := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Value), 0);
  lJArray := lJValue as TJSONArray;
  for I := 0 to Pred(lJArray.Size) do
  begin
    lJSON := (lJArray.Get(I) as TJSONObject);
    Result.Add(Self.JsonToObject(lJValue.ToString));
  end;
end;

function TCategoriaHelper.JsonToObject(Value: String): TCategoriaDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TCategoriaDTO>.JsonStringToObject(Value);
end;

function TCategoriaHelper.ListToJsonArray(
  Value: TObjectList<TCategoriaDTO>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for Self in Value do
    Result.Add(Self.ToJson);
end;

function TCategoriaHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TCategoria>.ObjectToJsonObject(Self);
end;

{ TClientesDTOHelper }

function TClientesDTOHelper.Convert(var aPessoa: TPessoas;
  var aEndereco: System.Generics.Collections.TObjectList<TEndereco>): TClientes;
var
  lEndereco: TEnderecoDTO;
begin
  aPessoa := TPessoas.New;
  aEndereco := System.Generics.Collections.TObjectList<TEndereco>.Create;
  Result := TClientes.New;
  Result.IdPessoa := Self.Id;
  Result.Tipo := Self.Tipo.ToString;
  Result.CpfCnpj := Self.CpfCnpj;
  aPessoa.Nome := Self.Nome;
  aPessoa.Email := Self.Email;
  aPessoa.Telefone := Self.Telefone;
  for lEndereco in Self.endereco do
    aEndereco.Add(lEndereco.Convert);
end;

function TClientesDTOHelper.JsonArrayToList(Value: String)
  : System.Generics.Collections.TObjectList<TClienteDTO>;
var
  lJValue: TJSONValue;
  lJSON: TJSONObject;
  lJArray: TJSONArray;
  I: Integer;
begin
  Result := System.Generics.Collections.TObjectList<TClienteDTO>.Create;
  lJValue := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Value), 0);
  lJArray := lJValue as TJSONArray;
  for I := 0 to Pred(lJArray.Size) do
  begin
    lJSON := (lJArray.Get(I) as TJSONObject);
    Result.Add(Self.JsonToObject(lJSON.ToString));
  end;
end;

function TClientesDTOHelper.JsonToObject(Value: String): TClienteDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TClienteDTO>.JsonStringToObject(Value);
end;

function TClientesDTOHelper.ListToJsonArray(
  Value: TObjectList<TClienteDTO>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for Self in Value do
    Result.Add(Self.ToJson);
end;

function TClientesDTOHelper.ToClientes: TClientes;
begin
  Result := TClientes.New;
  Result.IdPessoa := Self.Id;
  Result.Tipo := Self.Tipo.ToString;
  Result.CpfCnpj := Self.CpfCnpj;
end;

function TClientesDTOHelper.ToEndereco
  : System.Generics.Collections.TObjectList<TEndereco>;
var
  lEnd: TEnderecoDTO;
begin
  Result := System.Generics.Collections.TObjectList<TEndereco>.Create;
  for lEnd in Self.endereco do
    Result.Add(lEnd.Convert);
end;

function TClientesDTOHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TClientes>.ObjectToJsonObject(Self);
end;

function TClientesDTOHelper.ToPessoas: TPessoas;
begin
  Result := TPessoas.New;
  Result.Id := Self.Id;
  Result.Nome := Self.Nome;
  Result.Email := Self.Email;
  Result.Telefone := Self.Telefone;
end;

{ TTipoPessoaHelper }

function TTipoPessoaHelper.ToEnum(Value: String): TTipoPessoa;
begin
  Result := TTipoPessoa(GetEnumValue(TypeInfo(TTipoPessoa), UpperCase(Value)));
end;

function TTipoPessoaHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoPessoa), Integer(Self));
end;

{ TTipoEnderecoHelper }

function TTipoEnderecoHelper.ToEnum(Value: String): TTipoEndereco;
begin
  Result := TTipoEndereco(GetEnumValue(TypeInfo(TTipoEndereco),
    UpperCase(Value)));
end;

function TTipoEnderecoHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoEndereco), Integer(Self));
end;

{ TEnderecoDTOHelper }

function TEnderecoDTOHelper.Convert: TEndereco;
begin
  Result := TEndereco.New;
  Result.IdPessoa := Self.Id;
  Result.Logradouro := Self.Logradouro;
  Result.Numero := Self.Numero;
  Result.Complemento := Self.Complemento;
  Result.Cidade := Self.Cidade;
  Result.Estado := Self.Estado;
  Result.Bairro := Self.Bairro;
  Result.Tipo := Self.Tipo.ToString;
end;

{ TEnderecoHelper }

function TEnderecoHelper.Convert: TEnderecoDTO;
var
  lTipo: TTipoEndereco;
begin
  Result := TEnderecoDTO.New;
  Result.Id := Self.IdPessoa;
  Result.Logradouro := Self.Logradouro;
  Result.Numero := Self.Numero;
  Result.Complemento := Self.Complemento;
  Result.Cidade := Self.Cidade;
  Result.Bairro := Self.Bairro;
  Result.Estado := Self.Estado;
  Result.Tipo := lTipo.ToEnum(Self.Tipo);
end;

function TEnderecoHelper.Convert
  (aLista: System.Generics.Collections.TObjectList<TEndereco>)
  : System.Generics.Collections.TObjectList<TEnderecoDTO>;
var
  lEnd: TEndereco;
begin
  Result := System.Generics.Collections.TObjectList<TEnderecoDTO>.Create;
  for lEnd in aLista do
    Result.Add(lEnd.Convert);
end;

{ TClientesHelper }

function TClientesHelper.Convert(aPessoa: TPessoas;
  aEndereco: System.Generics.Collections.TObjectList<TEndereco>): TClienteDTO;
var
  lTipo: TTipoPessoa;
  lEnd: TEndereco;
begin
  Result := TClienteDTO.New;
  lEnd := TEndereco.New;

  Result.Id := Self.IdPessoa;
  Result.Nome := aPessoa.Nome;
  Result.Email := aPessoa.Email;
  Result.Telefone := aPessoa.Telefone;
  Result.endereco := lEnd.Convert(aEndereco);
  Result.Tipo := lTipo.ToEnum(Self.Tipo);
  Result.CpfCnpj := Self.CpfCnpj;
end;

{ TUsuarioDTOHelper }

function TUsuarioDTOHelper.Convert(var aPessoa: TPessoas): TUsuarios;
begin
  Result := TUsuarios.New;
  aPessoa := TPessoas.New;
  Result.IdPessoa := Self.Id;
  Result.Senha := Self.Senha;
  aPessoa.Nome := Self.Nome;
  aPessoa.Email := Self.Email;
end;

function TUsuarioDTOHelper.JsonToObject(Value: String): TUsuarioDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TUsuarioDTO>.JsonStringToObject(Value);
end;

function TUsuarioDTOHelper.ListToJsonArray(
  Value: TObjectList<TUsuarioDTO>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for self in Value do
    Result.Add(Self.ToJson);
end;

function TUsuarioDTOHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TUsuarioDTO>.ObjectToJsonObject(Self);
end;

{ TUsuarioHelper }

function TUsuarioHelper.Convert(aPessoa: TPessoas): TUsuarioDTO;
begin
  Result := TUsuarioDTO.New;
  Result.Id := Self.IdPessoa;
  Result.Nome := aPessoa.Nome;
  Result.Email := aPessoa.Email;
  Result.Senha := Self.Senha;
end;

end.
