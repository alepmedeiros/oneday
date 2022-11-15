unit pedidosapi.backend.services.interfaces;

interface

uses
  System.Generics.Collections;

type
  iServices<T: class> = interface
    function FindAll: TObjectList<T>;
    function Find(aId: Integer): T; overload;
    function Find(aFK: String; aId: Integer): T; overload;
    function Find(aObj: T; aKey: String; aValue: Variant): iServices<T>; overload;
    function FindWhere(aKey: String; aValue: Variant): T; overload;
    function FindWhere(aKey: String; aValue: Integer): TObjectList<T>; overload;
    function Insert(Value: T): T;
    function Update(Value: T): T;
    function Delete(Value: T): iServices<T>; overload;
    function Delete(Value: Variant): iServices<T>; overload;
  end;

implementation

end.
