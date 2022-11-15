unit userapi.backend.service.user;

interface

uses
  System.Generics.Collections,
  userapi.backend.model.userrepository,
  userapi.backend.model.usuario;

type
  TUserService = class(TInterfacedObject, iUserRespository)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iUserRespository;
    function FindByCPF(aCPF: String): TUser;
    function QueryByNameLike(aNome: String): TObjectList<TUser>;
  end;

implementation

constructor TUserService.Create;
begin

end;

destructor TUserService.Destroy;
begin

  inherited;
end;

class function TUserService.New: iUserRespository;
begin
  Result := Self.Create;
end;

end.
