unit acpedidos.providers.frames.pedidos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Effects;

type
  TframePedidos = class(TFrame)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Label2: TLabel;
    Layout4: TLayout;
    lblProduto: TLabel;
    Layout5: TLayout;
    Label3: TLabel;
    lblQuantidade: TLabel;
    Label4: TLabel;
    lblUnitario: TLabel;
    Layout2: TLayout;
    Label1: TLabel;
    lblItem: TLabel;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
