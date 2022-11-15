unit cadastrosapi.backend.model.entity.pessoas;

interface

uses
  SimpleAttributes;

type
  [Tabela('PESSOAS')]
  TPessoas = class
  private
    FId: Integer;
    FNome: String;
    FDataNascReg: TDateTime;
    FEmail: String;
    FTelefone: String;
  public
    [Campo('ID'), PK, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('NOME')]
    property Nome: String read FNome write FNome;
    [Campo('EMAIL')]
    property Email: String read FEmail write FEmail;
    [Campo('TELEFONE')]
    property Telefone: String read FTelefone write FTelefone;

    class function New: TPessoas;
  end;

implementation

{ TPessoas }

class function TPessoas.New: TPessoas;
begin
  Result := Self.Create;
end;

end.
