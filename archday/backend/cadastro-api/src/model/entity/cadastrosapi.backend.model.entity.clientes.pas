unit cadastrosapi.backend.model.entity.clientes;

interface

uses
  SimpleAttributes;

type
  [Tabela('CLIENTES')]
  TClientes = class
  private
    FId: Integer;
    FIdPessoa: Integer;
    FTipo: String;
    FCpfCnpj: String;
  public
    [Campo('ID'), PK, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_PESSOA'), FK]
    property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    [Campo('TIPO')]
    property Tipo: String read FTipo write FTipo;
    [Campo('CPFCNPJ')]
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;

    class function New: TClientes;
  end;

implementation

{ TClientes }

class function TClientes.New: TClientes;
begin
  Result := Self.Create;
end;

end.
