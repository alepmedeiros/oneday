unit acpedidos.providers.frame.pedidos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Effects,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation;

type
  Tframepedidos = class(TFrame)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    lblItem: TLabel;
    Label2: TLabel;
    lblProduto: TLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    Label3: TLabel;
    lblQuantidad: TLabel;
    Label5: TLabel;
    lblUnitario: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
