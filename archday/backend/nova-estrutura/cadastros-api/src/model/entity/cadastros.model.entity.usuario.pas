unit cadastros.model.entity.usuario;

interface

uses
  System.SysUtils,
  SimpleAttributes;

type
  [Tabela('USUARIO')]
  TUsuario = class
  private
    FIdPessoa: Integer;
    FId: Integer;
    FEmail: String;
    FSenha: String;
    FDataCadastro: TDateTime;
    procedure SetDataCadastro(const Value: TDateTime);

  public
    [Campo('ID'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_PESSOA'), Fk]
    property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    [Campo('EMAIL')]
    property Email: String read FEmail write FEmail;
    [Campo('SENHA')]
    property Senha: String read FSenha write FSenha;
    [Campo('DATACADASTRO')]
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;

    class function New: TUsuario;
  end;

implementation

{ TUsuario }

class function TUsuario.New: TUsuario;
begin
  Result := Self.Create;
end;

procedure TUsuario.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
  FDataCadastro := Now;
end;

end.
