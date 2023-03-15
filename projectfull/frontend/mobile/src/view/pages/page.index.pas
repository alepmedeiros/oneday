unit page.index;

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
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  Router4D, page.splash;

type
  Tpageindex = class(TForm)
    LayoutContainer: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pageindex: Tpageindex;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure Tpageindex.FormCreate(Sender: TObject);
begin
  TRouter4D.Render<TPageSplash>.SetElement(LayoutContainer, LayoutContainer);
end;

end.
