unit Views.Clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Effects, Services.Clientes, FMX.Layouts,
  Providers.Frames.Clientes, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmClientes = class(TForm)
    retBackground: TRectangle;
    retHeader: TRectangle;
    txtHeader: TText;
    vsbClientes: TVertScrollBox;
    imgVoltar: TPath;
    retVoltar: TRectangle;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure retVoltarClick(Sender: TObject);
  private
    FService: TServiceClientes;
    procedure DesignClientes;
  end;

implementation

{$R *.fmx}

procedure TfrmClientes.DesignClientes;
var
  LFrame: TFrameClientes;
  I: Integer;
begin
  vsbClientes.BeginUpdate;
  try
    for I := Pred(vsbClientes.Content.ControlsCount) downto 0 do
      vsbClientes.Content.Controls[I].DisposeOf;
    FService.mtClientes.First;
    while not FService.mtClientes.Eof do
    begin
      LFrame := TFrameClientes.Create(vsbClientes);
      LFrame.Parent := vsbClientes;
      LFrame.Align := TAlignLayout.Top;
      LFrame.Position.X := vsbClientes.Content.ControlsCount * LFrame.Height;
      LFrame.Name := LFrame.ClassName + FService.mtClientesid.AsString;
      LFrame.lblNome.Text := Format('%s %s', [FService.mtClientesnome.AsString, FService.mtClientessobrenome.AsString]);
      LFrame.lblTelefone.Text := FService.mtClientestelefone.AsString;
      LFrame.lblEmail.Text := FService.mtClientesemail.AsString;
      FService.mtClientes.Next;
    end;
  finally
    vsbClientes.EndUpdate;
  end;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  FService :=  TServiceClientes.Create(Self);
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  FService.Free;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  try
    FService.GetAll;
    DesignClientes;
  except
    on E:Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmClientes.retVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

end.
