unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Effects, System.Rtti;

type
  TFrame2 = class(TFrame)
    Layout4: TLayout;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    ImageHome: TImage;
    ImageCard: TImage;
    ImageProfile: TImage;
    ImageStatic: TImage;
    ShadowStatic: TShadowEffect;
    ShadowProfile: TShadowEffect;
    ShadowCard: TShadowEffect;
    ShadowHome: TShadowEffect;
    procedure ImageStaticClick(Sender: TObject);
    procedure ImageProfileClick(Sender: TObject);
  private
    procedure FocusBotao(Image: TImage; Shadown: TShadowEffect);
    procedure DesabilitaBotao(Image: TImage; Shadown: TShadowEffect);
  public
    class function New(AOwner: TComponent): TFrame2;
  end;

implementation

{$R *.fmx}

{ TFrame2 }

// cor atual da imagem: #FF7B78AA

procedure TFrame2.DesabilitaBotao(Image: TImage; Shadown: TShadowEffect);
begin
  Shadown.Opacity := 0;
  Image.Bitmap.ReplaceOpaqueColor(TAlphaColor($FF7B78AA));
end;

procedure TFrame2.FocusBotao(Image: TImage; Shadown: TShadowEffect);
begin
  Shadown.Opacity := 1;
  Image.Bitmap.ReplaceOpaqueColor(TAlphaColorRec.White);
end;

procedure TFrame2.ImageProfileClick(Sender: TObject);
begin
  FocusBotao(ImageProfile, ShadowProfile);
end;

procedure TFrame2.ImageStaticClick(Sender: TObject);
begin
  FocusBotao(ImageStatic, ShadowStatic);
end;

class function TFrame2.New(AOwner: TComponent): TFrame2;
begin
  Result := Self.Create(AOwner);
end;

end.
