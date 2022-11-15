unit Views.Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts, Providers.Frames.Produtos,
  Services.Produtos;

type
  TfrmProdutos = class(TForm)
    retBackground: TRectangle;
    vsbProdutos: TVertScrollBox;
    retHeader: TRectangle;
    txtHeader: TText;
    retVoltar: TRectangle;
    imgVoltar: TPath;
    procedure retVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FService: TServiceProdutos;
    procedure DesignClientes;
  end;

implementation

{$R *.fmx}

procedure TfrmProdutos.DesignClientes;
var
  LFrame: TFrameProdutos;
  I: Integer;
begin
  vsbProdutos.BeginUpdate;
  try
    for I := Pred(vsbProdutos.Content.ControlsCount) downto 0 do
      vsbProdutos.Content.Controls[I].DisposeOf;
    FService.mtProdutos.First;
    while not FService.mtProdutos.Eof do
    begin
      LFrame := TFrameProdutos.Create(vsbProdutos);
      LFrame.Parent := vsbProdutos;
      LFrame.Align := TAlignLayout.Top;
      LFrame.Position.X := vsbProdutos.Content.ControlsCount * LFrame.Height;
      LFrame.Name := LFrame.ClassName + FService.mtProdutosid.AsString;
      LFrame.lblDescricao.Text := FService.mtProdutosdescricao.AsString;
      LFrame.lblGrupo.Text := FService.mtProdutosgrupo.AsString;
      LFrame.lblPreco.Text := FormatFloat(',0.00', FService.mtProdutospreco.AsCurrency);
      FService.mtProdutos.Next;
    end;
  finally
    vsbProdutos.EndUpdate;
  end;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  FService :=  TServiceProdutos.Create(Self);
end;

procedure TfrmProdutos.FormDestroy(Sender: TObject);
begin
  FService.Free;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  try
    FService.GetAll;
    DesignClientes;
  except
    on E:Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmProdutos.retVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

end.
