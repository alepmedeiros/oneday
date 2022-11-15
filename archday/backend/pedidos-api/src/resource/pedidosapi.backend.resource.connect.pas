unit pedidosapi.backend.resource.connect;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.ConsoleUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

var
  FConnList: TObjectList<TFDConnection>;
  FDriver: TFDPhysPgDriverLink;

function Connected: Integer;
procedure Disconnected(IndexConn: Integer);

implementation

function Connected: Integer;
var
  IndexConn: Integer;
begin
  if not Assigned(FConnList) then
    FConnList := TObjectList<TFDConnection>.Create;

  FConnList.Add(TFDConnection.Create(nil));
  FDriver := TFDPhysPgDriverLink.Create(nil);
  {$IFDEF MSWINDOWS}
  FDriver.VendorLib := '..\pgsql\libpq.dll';
  {$ENDIF}
  IndexConn := Pred(FConnList.Count);
  FConnList.Items[IndexConn].Params.Clear;
  FConnList.Items[IndexConn].Params.DriverID := 'PG';
  {$IFDEF MSWINDOWS}
  FConnList.Items[IndexConn].Params.Database := 'dados';
  FConnList.Items[IndexConn].Params.UserName := 'root';
  FConnList.Items[IndexConn].Params.Password := '1';
  FConnList.Items[IndexConn].Params.Add('Port=5432');
  FConnList.Items[IndexConn].Params.Add('Server=localhost');
  FConnList.Items[IndexConn].Params.Add('MetaCurSchema=vendas');
  FConnList.Items[IndexConn].Params.Add('MetaDefSchema=vendas');
  {$ELSE}
  FConnList.Items[IndexConn].Params.Database := GetEnvironmentVariable('DATABASE');;
  FConnList.Items[IndexConn].Params.UserName := GetEnvironmentVariable('DATABASE_USER');
  FConnList.Items[IndexConn].Params.Password := GetEnvironmentVariable('DATABASE_PWD');
  FConnList.Items[IndexConn].Params.Add('Port=5432');
  FConnList.Items[IndexConn].Params.Add('Server=' + GetEnvironmentVariable('DATABASE_HOST'));
  {$ENDIF}
  FConnList.Items[IndexConn].Connected;
  Result := IndexConn;
end;

procedure Disconnected(IndexConn: Integer);
begin
  FConnList.Items[IndexConn].Connected := false;
  FConnList.Items[IndexConn].Free;
  FConnList.TrimExcess;
end;

end.
