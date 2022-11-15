unit cadastrosapi.backend.dto.usuario;

interface

type
  TUsuarioDTO = class
  private
    FId: Integer;
    FNome: String;
    FEmail: String;
    FSenha: String;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Email: String read FEmail write FEmail;
    property Senha: String read FSenha write FSenha;

    class function New: TUsuarioDTO;
  end;

implementation

{ TUsuarioDTO }

class function TUsuarioDTO.New: TUsuarioDTO;
begin
  Result := Self.Create;
end;

end.
