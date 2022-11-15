unit autenticacaoapi.backend.utils;

interface

uses
  System.SysUtils,
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces,
  autenticacaoapi.backend.dto.usuario,
  autenticacaoapi.backend.model.usuario;

type
  TUsuarioDTOHelper = class helper for TUserDTO
    function Convert: TUser; overload;
    function JsonToObject(Value: String): TUserDTO;
    function ListToJSonArray(Value: TObjectList<TUserDTO>): TJSONArray;
    function ToJSON: TJSONObject;
  end;

  TUsuarioHelper = class helper for TUser
    function Convert: TUserDTO; overload;
    function Convert(value: TObjectList<TUser>): TObjectList<TUserDTO>; overload;
  end;

implementation

{ TUsuarioDTOHelper }

function TUsuarioDTOHelper.Convert: TUser;
begin
  Result := TUser.New;
  Result.Id := Self.Id;
  Result.Nome := Self.Nome;
  Result.Cpf := Self.Cpf;
  Result.Endereco := Self.Endereco;
  Result.Email := Self.Email;
  REsult.Telefone := Self.Telefone;
  Result.Senha := Self.Senha;
  Result.DataCadastro := now;
end;

function TUsuarioDTOHelper.JsonToObject(Value: String): TUserDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TUserDTO>.JsonStringToObject(Value);
end;

function TUsuarioDTOHelper.ListToJSonArray(
  Value: TObjectList<TUserDTO>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for self in value do
    Result.Add(Self.ToJSON);
end;

function TUsuarioDTOHelper.ToJSON: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TUserDTO>.ObjectToJsonObject(Self);
end;

{ TUsuarioHelper }

function TUsuarioHelper.Convert(
  value: TObjectList<TUser>): TObjectList<TUserDTO>;
var
  lUser: TUser;
begin
  Result := TObjectList<TUserDTO>.Create;
  for lUser in Value do
    Result.Add(lUser.Convert);
end;

function TUsuarioHelper.Convert: TUserDTO;
begin
  Result := TUserDTO.New;
  Result.Id := Self.Id;
  Result.Nome := Self.Nome;
  Result.Cpf := Self.Cpf;
  Result.Endereco := Self.Endereco;
  Result.Email := Self.Email;
  Result.Telefone := Self.Telefone;
  Result.Senha := Self.Senha;
  Result.DataCadastro := Self.DataCadastro;
end;

end.
