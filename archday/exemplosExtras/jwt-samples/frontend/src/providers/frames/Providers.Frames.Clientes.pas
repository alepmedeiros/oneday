unit Providers.Frames.Clientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TFrameClientes = class(TFrame)
    retContent: TRectangle;
    lblEmail: TLabel;
    lblNome: TLabel;
    lineSeparator: TLine;
    lblTelefone: TLabel;
  end;

implementation

{$R *.fmx}

end.
