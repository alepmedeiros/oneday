unit autenticacaoapi.backend.model.convert;

interface

uses
  System.Generics.Collections,
  autenticacaoapi.backend.model.usuario,
  autenticacaoapi.backend.dto.usuario;

function Converter(aUser: TUser): TUserDTO; overload;
function Converter(aDTO: TUserDTO): TUser; overload;
function Converter(aUsers: TObjectList<TUser>): TObjectList<TUserDTO>; overload;
function Converter(aDTOs: TObjectList<TUserDTO>): TObjectList<TUser>; overload;

implementation

function Converter(aUser: TUser): TUserDTO; overload;
var
  lDto: TUserDTO;
begin
  lDto := TUserDTO.New;
  lDto.Id := aUser.Id;
  lDto.Nome := aUser.Nome;
  lDto.Cpf := aUser.Cpf;
  lDto.Endereco := aUser.Endereco;
  lDto.Email := aUser.Email;
  lDto.Telefone := aUser.Telefone;
  lDto.DataCadastro := aUser.DataCadastro;

  Result := lDto;
end;

function Converter(aDTO: TUserDTO): TUser; overload;
var
  lUser: TUser;
begin
  lUser := TUser.New;
  lUser.Id := aDTO.Id;
  lUser.Nome := aDTO.Nome;
  lUser.Cpf := aDTO.Cpf;
  lUser.Endereco := aDTO.Endereco;
  lUser.Email := aDTO.Email;
  lUser.Telefone := aDTO.Telefone;
  lUser.DataCadastro := aDTO.DataCadastro;

  Result := lUser;
end;

function Converter(aUsers: TObjectList<TUser>): TObjectList<TUserDTO>;
var
  luser: TUser;
begin
  Result := TObjectList<TUserDTO>.Create;
  for luser in aUsers do
    Result.Add(Converter(lUser));
end;

function Converter(aDTOs: TObjectList<TUserDTO>): TObjectList<TUser>;
var
  ldto: TUserDTO;
begin
  Result := TObjectList<TUser>.Create;
  for ldto in aDTOs do
    Result.Add(Converter(ldto));
end;

end.
