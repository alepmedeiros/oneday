unit userapi.backend.model.interfaces;

interface

uses
  userapi.backend.model.usuario;

type
  iFactoryEntity = interface
    function User: TUser;
  end;

implementation

end.
