unit cadastros.model.entity.contato;

interface

uses
  SimpleAttributes;

type
  [Tabela('CONTATO')]
  TContato = class
  private
    FId: Integer;
    FIdPessoa: Integer;
    FTipo: String;
    FTelefone: String;
    FNome: String;
    FEmail: String;
  public
    [Campo('ID'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_PESSOA')]
    property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    [Campo('TIPO')]
    property Tipo: String read FTipo write FTipo;
    [Campo('TELEFONE')]
    property Telefone: String read FTelefone write FTelefone;
    [Campo('EMAIL')]
    property Email: String read FEmail write FEmail;
    [Campo('NOME')]
    property Nome: String read FNome write FNome;

    class function New: TContato;
  end;

implementation

{ TContato }

class function TContato.New: TContato;
begin
  Result := Self.Create;
end;

end.
