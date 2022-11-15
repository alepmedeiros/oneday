unit autenticacaoapi.backend.resource.Autorizacao;

interface

uses
  System.SysUtils,
  Horse,
  Horse.JWT,
  JOSE.Core.JWT,
  JOSE.Core.Builder,
  autenticacaoapi.backend.services,
  autenticacaoapi.backend.model.usuario,
  autenticacaoapi.backend.dto.usuario;

function Autorizacao: THorseCallBack;
function ValidarAutorizacao(aEmail, aSenha: String): Boolean;

implementation

var
  FUserDTO: TUserDTO;

function ValidarAutorizacao(aEmail, aSenha: String): Boolean;
begin
  Result := (TServices<TUser>.New.FindWhere('email', aEmail).Email.IsEmpty and
    TServices<TUser>.New.FindWhere('senha', aSenha).senha.IsEmpty);
end;

function Autorizacao: THorseCallBack;
begin
  Result := HorseJWT('Alessandro');
end;

end.
