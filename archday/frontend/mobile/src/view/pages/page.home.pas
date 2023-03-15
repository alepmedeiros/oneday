unit page.home;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.MultiView,
  FMX.Effects,
  Router4D,
  Router4D.Interfaces,
  page.Pedidos;

type
  Tpagehome = class(TForm, iRouter4DComponent)
    Layoutcontainer: TLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    ImageHome: TImage;
    ShadowHome: TShadowEffect;
    ImageCard: TImage;
    ShadowCard: TShadowEffect;
    ImageProfile: TImage;
    ShadowProfile: TShadowEffect;
    ImageStatic: TImage;
    ShadowStatic: TShadowEffect;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    Label1: TLabel;
    Layout4: TLayout;
    procedure ImageHomeClick(Sender: TObject);
    procedure ImageStaticClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  pagehome: Tpagehome;

implementation

{$R *.fmx}

{ Tpagehome }

procedure Tpagehome.ImageHomeClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Home');
end;

procedure Tpagehome.ImageStaticClick(Sender: TObject);
begin
  TRouter4D.Render<TPagePedidos>.SetElement(Layout4);
end;

function Tpagehome.Render: TFMXObject;
begin
  Result := Layout4;
end;

procedure Tpagehome.UnRender;
begin

end;

end.
