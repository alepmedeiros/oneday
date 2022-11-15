unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs {} ,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.PG,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.StdCtrls,
  RestRequest4D;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDQuery1: TFDQuery;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  lJSON:String;
  lservidor:AnsiString;
begin
  lservidor:='http://localhost:9000';
  lJSON :=
  TRequest.new
    .BaseURL('http://localhost:9001/clientes')
    .TokenBearer('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NjQxMjkzMzQsImV4cCI6MTY2NDEzMjkzNH0.fY-1irRSSPLbn4CGTNktXZsp5hkyCilyd-4m-JPn_kk')
    .AddHeader('servidor', lservidor)
    .Get.Content;

  Memo1.Lines.Add(lJSON);
end;

end.
