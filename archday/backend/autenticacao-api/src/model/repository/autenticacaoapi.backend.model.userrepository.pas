unit autenticacaoapi.backend.model.userrepository;

interface

uses
  System.Generics.Collections,
  autenticacaoapi.backend.model.usuario;

type
  iUserRespository = interface
    function FindByCPF(aCPF: String): TUser;
    function QueryByNameLike(aNome: String): TObjectList<TUser>;
  end;

implementation

end.
