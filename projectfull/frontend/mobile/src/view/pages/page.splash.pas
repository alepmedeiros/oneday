unit page.splash;

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
  Router4D,
  Router4D.Interfaces;

type
  TPageSplash = class(TForm,iRouter4DComponent)
    Layout1: TLayout;
    RectangleImage: TRectangle;
    RectangleBackground: TRectangle;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    function Render : TFMXObject;
    procedure UnRender;
  end;

var
  PageSplash: TPageSplash;

implementation

{$R *.fmx}

{ TPageSplash }

function TPageSplash.Render: TFMXObject;
begin
  Result := Layout1;

  Timer1.Interval := 2000;
  Timer1.Enabled := true;
  RectangleImage.Opacity := 0;
  RectangleImage.Align := TAlignLayout.None;

  RectangleImage.AnimateFloat('Opacity', 1, 0.8);
  RectangleImage.AnimateFloatDelay('Position.Y', 5, 0.3, 0.9,
    TAnimationType.&In, TInterpolationType.Back);
end;

procedure TPageSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;

  TRouter4D.Link.&To('Login');
end;

procedure TPageSplash.UnRender;
begin

end;

end.
