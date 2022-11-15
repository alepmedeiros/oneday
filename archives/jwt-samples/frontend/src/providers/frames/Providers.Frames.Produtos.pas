unit Providers.Frames.Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TFrameProdutos = class(TFrame)
    retContent: TRectangle;
    lblGrupo: TLabel;
    lblDescricao: TLabel;
    lineSeparator: TLine;
    lblPreco: TLabel;
  end;

implementation

{$R *.fmx}

end.
