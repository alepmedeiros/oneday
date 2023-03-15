unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts;

type
  TFrame3 = class(TFrame)
    Layout2: TLayout;
    Rectangle3: TRectangle;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    rectangle2: TRectangle;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TFrame3;
  end;

implementation

{$R *.fmx}

{ TFrame3 }

class function TFrame3.New(AOwner: TComponent): TFrame3;
begin
  Result := self.Create(AOwner)
end;

end.
