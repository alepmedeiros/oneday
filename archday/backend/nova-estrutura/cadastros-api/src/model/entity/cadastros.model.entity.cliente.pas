unit cadastros.model.entity.cliente;

interface

uses
  SimpleAttributes;

type
  [Tabela('CLIENTE')]
  TCliente = class
  private
    FId: Integer;
    FIdPessoa: Integer;
    FCpfCnpj: String;
    FDataNascReg: TDateTime;
    FFantasia: String;
    FReg: String;
    FRg: String;
    FSexo: String;
    procedure SetDataNascReg(const Value: TDateTime);
  public
    [Campo('ID'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_PESSOA')]
    property IdPessoa: Integer read FIdPessoa write FIdPessoa;
    [Campo('CPFCNPJ')]
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
    [Campo('RG')]
    property Rg: String read FRg write FRg;
    [Campo('DATANASCREG')]
    property DataNascReg: TDateTime read FDataNascReg write SetDataNascReg;
    [Campo('SEXO')]
    property Sexo: String read FSexo write FSexo;

    class function New: TCliente;
  end;

implementation

{ TCliente }

class function TCliente.New: TCliente;
begin
  Result := Self.Create;
end;

procedure TCliente.SetDataNascReg(const Value: TDateTime);
begin
  FDataNascReg := Value;
end;

end.
