unit userapi.backend.model.factoryEntity;

interface

uses
  userapi.backend.model.interfaces, userapi.backend.model.usuario;

type
  TFactoryEntity = class(TInterfacedObject, iFactoryEntity)
    private
      FUser: TUser;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFactoryEntity;
      function User: TUser;
  end;

implementation

constructor TFactoryEntity.Create;
begin

end;

destructor TFactoryEntity.Destroy;
begin

  inherited;
end;

class function TFactoryEntity.New : iFactoryEntity;
begin
  Result := Self.Create;
end;

function TFactoryEntity.User: TUser;
begin
  if not Assigned(FUser) then
    FUser := TUser.New;
  Result := FUser;
end;

end.
