unit pedidosapi.backend.services.microserives;

interface

uses
  System.Generics.Collections,
  pedidosapi.backend.services.interfaces,
  pedidosapi.bachend.auth.interfaces,
  pedidosapi.bachend.auth.httpclient;

type
  TMicroService<T: Class, constructor> = class(TInterfacedObject, iServices<T>)
  private
    FHttp: iHttpClient;
    FRecurso: String;
  public
    constructor Create(aUrl, aRecurso: String);
    destructor Destroy; override;
    class function New(aUrl, aRecurso: String): iServices<T>;
    function FindAll: TObjectList<T>;
    function Find(aId: Integer): T; overload;
    function Find(aFK: String; aId: Integer): T; overload;
    function Find(aObj: T; aKey: String; aValue: Variant)
      : iServices<T>; overload;
    function FindWhere(aKey: String; aValue: Variant): T; overload;
    function FindWhere(aKey: String; aValue: Integer): TObjectList<T>; overload;
    function Insert(Value: T): T;
    function Update(Value: T): T;
    function Delete(Value: T): iServices<T>; overload;
    function Delete(Value: Variant): iServices<T>; overload;
  end;

implementation

constructor TMicroService<T>.Create(aUrl, aRecurso: String);
begin
  FHttp := THttpClient.New(aUrl);
end;

function TMicroService<T>.Delete(Value: T): iServices<T>;
begin
  Result := Self;
end;

function TMicroService<T>.Delete(Value: Variant): iServices<T>;
begin
  Result := Self;
  FHttp.Delete(Value);
end;

destructor TMicroService<T>.Destroy;
begin

  inherited;
end;

function TMicroService<T>.Find(aId: Integer): T;
begin

end;

function TMicroService<T>.Find(aObj: T; aKey: String; aValue: Variant)
  : iServices<T>;
begin

end;

function TMicroService<T>.Find(aFK: String; aId: Integer): T;
begin

end;

function TMicroService<T>.FindAll: TObjectList<T>;
begin

end;

function TMicroService<T>.FindWhere(aKey: String; aValue: Integer)
  : TObjectList<T>;
begin

end;

function TMicroService<T>.FindWhere(aKey: String; aValue: Variant): T;
begin

end;

function TMicroService<T>.Insert(Value: T): T;
begin

end;

class function TMicroService<T>.New(aUrl: String): iServices<T>;
begin
  Result := Self.Create(aUrl);
end;

function TMicroService<T>.Update(Value: T): T;
begin

end;

end.
