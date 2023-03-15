unit Views.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects, FMX.Objects, FMX.StdCtrls, FMX.Layouts,
  FMX.Controls.Presentation, FMX.MultiView, Views.Clientes, Views.Produtos;

type
  TfrmMenu = class(TForm)
    mvwPrincipal: TMultiView;
    vsbMenuMenu: TVertScrollBox;
    retMenuContent: TRectangle;
    retSair: TRectangle;
    imgSair: TPath;
    lblSair: TText;
    lineSeparator: TLine;
    retClientes: TRectangle;
    imgClientes: TPath;
    lblClientes: TText;
    retHome: TRectangle;
    imgHome: TPath;
    lblHome: TText;
    retHeader: TRectangle;
    imgMenu: TPath;
    retBackground: TRectangle;
    txtSolicitarAcesso: TText;
    imgLogo: TImage;
    retProdutos: TRectangle;
    imgProdutos: TPath;
    txtProdutos: TText;
    lytContent: TLayout;
    retMenu: TRectangle;
    procedure retSairClick(Sender: TObject);
    procedure retHomeClick(Sender: TObject);
    procedure retClientesClick(Sender: TObject);
    procedure retProdutosClick(Sender: TObject);
  end;

implementation

{$R *.fmx}

procedure TfrmMenu.retClientesClick(Sender: TObject);
var
  LForm: TfrmClientes;
begin
  LForm := TfrmClientes.Create(Self);
  LForm.Show;
  mvwPrincipal.HideMaster;
end;

procedure TfrmMenu.retHomeClick(Sender: TObject);
begin
  mvwPrincipal.HideMaster;
end;

procedure TfrmMenu.retProdutosClick(Sender: TObject);
var
  LForm: TfrmProdutos;
begin
  LForm := TfrmProdutos.Create(Self);
  LForm.Show;
  mvwPrincipal.HideMaster;
end;

procedure TfrmMenu.retSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
