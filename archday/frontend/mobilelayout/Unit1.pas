unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Layout3: TLayout;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    rectangle2: TRectangle;
    Arc1: TArc;
    Arc2: TArc;
    Arc3: TArc;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    Arc4: TArc;
    ShadowEffect3: TShadowEffect;
    Layout5: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Label3: TLabel;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    Layout14: TLayout;
    Circle2: TCircle;
    Circle3: TCircle;
    Layout15: TLayout;
    Layout16: TLayout;
    Label4: TLabel;
    Layout17: TLayout;
    Label5: TLabel;
    Layout18: TLayout;
    Layout19: TLayout;
    Layout20: TLayout;
    Image1: TImage;
    Layout21: TLayout;
    Image2: TImage;
    Layout22: TLayout;
    Rectangle3: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  unit2, unit3;

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Layout22.AddObject(TFrame2.New(Self).Layout4);
end;

end.
