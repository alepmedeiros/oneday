unit autenticacaoapi.backend.resource.cachekeys;

interface

uses
  System.SysUtils,
  System.JSON,
  LocalCache4D, System.DateUtils;

type
  iCacheKeys = interface
    function PublicKey(Value: String): iCacheKeys; overload;
    function PublicKey: String; overload;
    function PrivateKey(Value: String): iCacheKeys; overload;
    function TokenExpired: Boolean;
  end;

  TCacheKeys = class(TInterfacedObject, iCacheKeys)
  private
    FPublicKey: String;
    FPrivateKey: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iCacheKeys;
    function PublicKey(Value: String): iCacheKeys; overload;
    function PublicKey: String; overload;
    function PrivateKey(Value: String): iCacheKeys; overload;
    function TokenExpired: Boolean;
  end;

implementation

{ TSaveKeys }

constructor TCacheKeys.Create;
begin
  if not FileExists('savetkeys.lc4') then
    LocalCache.SaveToStorage('savetkeys.lc4');
  LocalCache.LoadDatabase('savetkeys.lc4').Instance('cachekeys');
end;

destructor TCacheKeys.Destroy;
begin
  LocalCache.SaveToStorage('savetkeys.lc4');
  inherited;
end;

class function TCacheKeys.New: iCacheKeys;
begin
  Result := Self.Create;
end;

function TCacheKeys.PrivateKey(Value: String): iCacheKeys;
begin
  Result := Self;

end;

function TCacheKeys.PublicKey(Value: String): iCacheKeys;
begin

end;

function TCacheKeys.PublicKey: String;
begin

end;

function TCacheKeys.TokenExpired: Boolean;
begin

end;

end.
