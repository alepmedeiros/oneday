unit cadastrosapi.backend.model.entity.usuarios;

interface

uses
  SimpleAttributes;

type
  [Tabela('USUARIOS')]
  TUsuarios = class
  private
    FId: Integer;
    FIdPessoa: Integer;
    FSenha: String;
  public
    [Campo('ID'), PK, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_PESSOA'), FK]
    property IdPessoa: Integer read FidPessoa write FidPessoa;
    [Campo('SENHA')]
    property Senha: String read FSenha write FSenha;

    class function New: TUsuarios;
  end;

implementation

{ TUsuarios }

class function TUsuarios.New: TUsuarios;
begin
  Result := Self.Create;
end;

end.
