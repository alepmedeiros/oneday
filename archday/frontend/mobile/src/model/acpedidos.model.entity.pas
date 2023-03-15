unit acpedidos.model.entity;

interface

uses
  System.Json,
  system.SysUtils,
  system.Generics.Collections,
  GBJSON.Interfaces;

type
  TUsuario = class
  private
    FNome: String;
    FEmail: String;
    FSenha: String;
    FId: Integer;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Email: String read FEmail write FEmail;
    property Senha: String read FSenha write FSenha;

    constructor Create;
    destructor Destroy; override;
    class function New: TUsuario;
    function ConvertToJson: TJsonObject;
    function ConvertJsonToObject(Value: String) : TUsuario;
  end;

  TCategoria = class
  private
    FDescricao: String;
    FId: Integer;
  public
    property Id: Integer read FId write FId;
    property Descricao: String read FDescricao write FDescricao;

    constructor Create;
    class function New: TCategoria;
    function ConvertToJson: TJsonObject;
    function ConvertJsonToObject(Value: String) : TCategoria;
  end;

  TProduto = class
  private
    FDescricao: String;
    FId: Integer;
  public
    property Id: Integer read FId write FId;
    property Descricao: String read FDescricao write FDescricao;

    constructor Create;
    destructor Destroy; override;
    class function New: TProduto;
    function ConvertToJson: TJsonObject;
    function ConvertJsonToObject(Value: String) : TProduto;
  end;

  TPedidoItens = class
  private
    FProduto: TProduto;
    FUnitario: Currency;
    FId: Integer;
    FItem: Integer;
    FQuantidade: Double;
    FTotal: Currency;
  public
    property Id: Integer read FId write FId;
    property Item: Integer read FItem write FItem;
    property Produto: TProduto read FProduto write FProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property Unitario: Currency read FUnitario write FUnitario;
    property Total: Currency read FTotal write FTotal;


    constructor Create;
    destructor Destroy; override;
    class function New: TPedidoItens;
    function ConvertToJson: TJsonObject;
    function ConvertJsonToObject(Value: String) : TPedidoItens;
  end;

  TPedidos = class
  private
    FProduto: TObjectList<TPedidoItens>;
    FCliente: Integer;
    FTotal: Currency;
    FId: Integer;
  public
    property Id: Integer read FId write FId;
    property Cliente: Integer read FCliente write FCliente;
    property Produto: TObjectList<TPedidoItens> read FProduto write FProduto;
    property Total: Currency read FTotal write FTotal;

    constructor Create;
    destructor Destroy; override;
    class function New: TPedidos;
    function ConvertToJson: TJsonObject;
    function ConvertJsonToObject(Value: String) : TPedidos;
  end;

implementation

{ TPedidoItens }

function TPedidoItens.ConvertJsonToObject(Value: String): TPedidoItens;
begin
  Result := TGBJSONDefault.Serializer<TPedidoItens>.JsonStringToObject(Value);
end;

function TPedidoItens.ConvertToJson: TJsonObject;
begin
  Result := TGBJSONDefault.Deserializer<TPedidoItens>.ObjectToJsonObject(Self);
end;

constructor TPedidoItens.Create;
begin
  FProduto:= TProduto.New;
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TPedidoItens.Destroy;
begin
  FProduto.Free;
  inherited;
end;

class function TPedidoItens.New: TPedidoItens;
begin
  Result := Self.Create;
end;

{ TPedidos }

function TPedidos.ConvertJsonToObject(Value: String): TPedidos;
begin
  Result := TGBJSONDefault.Serializer<TPedidos>.JsonStringToObject(Value);
end;

function TPedidos.ConvertToJson: TJsonObject;
begin
  Result := TGBJSONDefault.Deserializer<TPedidos>.ObjectToJsonObject(Self);
end;

constructor TPedidos.Create;
begin
  FProduto:= TObjectList<TPedidoItens>.Create;
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TPedidos.Destroy;
begin
  FProduto.Free;
  inherited;
end;

class function TPedidos.New: TPedidos;
begin
  Result := Self.Create;
end;

{ TCategoria }

function TCategoria.ConvertJsonToObject(Value: String): TCategoria;
begin
  Result := TGBJSONDefault.Serializer<TCategoria>.JsonStringToObject(Value);
end;

function TCategoria.ConvertToJson: TJsonObject;
begin
  Result := TGBJSONDefault.Deserializer<TCategoria>.ObjectToJsonObject(Self);
end;

constructor TCategoria.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

class function TCategoria.New: TCategoria;
begin
  Result := Self.Create;
end;

{ TProduto }

function TProduto.ConvertJsonToObject(Value: String): TProduto;
begin
  Result := TGBJSONDefault.Serializer<TProduto>.JsonStringToObject(Value);
end;

function TProduto.ConvertToJson: TJsonObject;
begin
  Result := TGBJSONDefault.Deserializer<TProduto>.ObjectToJsonObject(Self);
end;

constructor TProduto.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

class function TProduto.New: TProduto;
begin
  Result := Self.Create;
end;

{ TUsuario }

function TUsuario.ConvertJsonToObject(Value: String): TUsuario;
begin
  Result := TGBJSONDefault.Serializer<TUsuario>.JsonStringToObject(Value);
end;

function TUsuario.ConvertToJson: TJsonObject;
begin
  Result := TGBJSONDefault.Deserializer<TUsuario>.ObjectToJsonObject(Self);
end;

constructor TUsuario.Create;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;

class function TUsuario.New: TUsuario;
begin
  Result := Self.Create;
end;

end.
