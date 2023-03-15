unit page.Pedidos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Effects,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.StdCtrls,
  Router4D,
  Router4D.Interfaces, acpedidos.providers.frame.pedidos,
  acpedidos.services.pedidos, acpedidos.model.entidades;

type
  TPagePedidos = class(TForm, iRouter4DComponent)
    LayoutContainer: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle2: TRectangle;
    edtCodigoCliente: TEdit;
    ShadowEffect1: TShadowEffect;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    edtCliente: TEdit;
    ShadowEffect2: TShadowEffect;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Rectangle4: TRectangle;
    edtCodigoProduto: TEdit;
    ShadowEffect3: TShadowEffect;
    Layout11: TLayout;
    Layout12: TLayout;
    Rectangle5: TRectangle;
    edtDescricaoProduto: TEdit;
    ShadowEffect4: TShadowEffect;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    Rectangle6: TRectangle;
    edtQuantidade: TEdit;
    ShadowEffect5: TShadowEffect;
    Layout16: TLayout;
    Layout17: TLayout;
    Rectangle7: TRectangle;
    edtValorUnitario: TEdit;
    ShadowEffect6: TShadowEffect;
    Layout18: TLayout;
    Rectangle8: TRectangle;
    SpeedButton1: TSpeedButton;
    Layout19: TLayout;
    vsbPedidos: TVertScrollBox;
    Layout20: TLayout;
    Layout21: TLayout;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Layout22: TLayout;
    Label2: TLabel;
    lblTotal: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    FServices: TServicesPedidos;
    FPedidos: TPedidos;
    FItem: Integer;
    procedure DesignClientes;
    procedure LimparEdits;
  public
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  PagePedidos: TPagePedidos;

implementation

{$R *.fmx}

function TPagePedidos.Render: TFMXObject;
begin
  Result := LayoutContainer;
  FPedidos := TPedidos.New;
  FServices := TServicesPedidos.New;
end;

procedure TPagePedidos.SpeedButton1Click(Sender: TObject);
var
  lProduto: TPedidoItens;
begin
  Inc(FItem);

  FPedidos.Cliente := StrToInt(edtCodigoCliente.Text);

  lProduto := TPedidoItens.New;
  lProduto.Item := FItem;
  lProduto.Quantidade := StrToFloat(edtQuantidade.Text);
  lProduto.Unitario := StrToCurr(edtValorUnitario.Text);
  lProduto.Total := lProduto.Unitario*lProduto.Quantidade;
  lProduto.Produto.Id := StrToInt(edtCodigoProduto.Text);
  lProduto.Produto.Descricao := edtDescricaoProduto.Text;

  FPedidos.Total := FPedidos.Total + lProduto.Total;
  FPedidos.Produto.Add(lProduto);

  lblTotal.Text := FormatFloat('"R$ ",0.00', FPedidos.Total);

  DesignClientes;
  LimparEdits;
end;

procedure TPagePedidos.SpeedButton2Click(Sender: TObject);
begin
  TRouter4D.Link.GoBack;
end;

procedure TPagePedidos.SpeedButton3Click(Sender: TObject);
var
  I: Integer;
begin
  for I := Pred(vsbPedidos.Content.ControlsCount) downto 0 do
    vsbPedidos.Content.Controls[I].DisposeOf;

  lblTotal.Text := '';
  LimparEdits;

  edtCodigoCliente.Text := '';
  edtCliente.Text := '';

  FServices.Gravar(FPedidos);
  ShowMessage('Pedido Finalizado com Suceeso!');
end;

procedure TPagePedidos.UnRender;
begin

end;

procedure TPagePedidos.DesignClientes;
var
  lFrame : Tframepedidos;
begin
  vsbPedidos.BeginUpdate;
  try
    lFrame:= Tframepedidos.Create(vsbPedidos);
    lFrame.Parent := vsbPedidos;
    lFrame.Align := TAlignLayout.Top;
    lFrame.Name := lFrame.ClassName + FItem.ToString;
    lFrame.lblProduto.Text := edtDescricaoProduto.Text;
    lFrame.lblUnitario.Text := FormatFloat('"R$ ",0.00', StrToFloat(edtValorUnitario.Text));
    lFrame.lblItem.Text := FItem.ToString;
    lFrame.lblQuantidad.Text := edtQuantidade.Text;
  finally
    vsbPedidos.EndUpdate;
  end;
end;

procedure TPagePedidos.LimparEdits;
begin
  edtCodigoProduto.Text := '';
  edtDescricaoProduto.Text := '';
  edtQuantidade.Text := '';
  edtValorUnitario.Text := '';
end;

end.
