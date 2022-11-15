unit autenticacaoapi.backend.controller;

interface

uses
  System.Generics.Collections,
  autenticacaoapi.backend.dto.usuario,
  autenticacaoapi.backend.services,
  Horse,
  gbjson.Interfaces,
  System.SysUtils,
  System.JSON,
  autenticacaoapi.backend.model.usuario,
  autenticacaoapi.backend.resource.Autorizacao,
  autenticacaoapi.backend.model.convert,
  JOSE.Core.JWT,
  System.DateUtils,
  JOSE.Core.Builder,
  autenticacaoapi.backend.utils;

procedure Registery(App: THorse);

implementation

procedure Autorizado(Req: THorseRequest; Res: THorseResponse);
begin
  Res.Status(204);
end;

procedure Login(Req: THorseRequest; Res: THorseResponse);
var
  JWT: TJWT;
  Claims: TJWTClaims;
  lHora: integer;
  lJson: TJSONObject;
begin
  JWT := TJWT.Create;
  Claims := JWT.Claims;
  Claims.JSON := TJSONObject.Create;
  Claims.IssuedAt := Now;
  Claims.Expiration := IncHour(Now,1);
  lHora := trunc(Claims.Expiration);
  if not ValidarAutorizacao(Req.Params['email'], Req.Params['senha']) then
  begin
    Res.Send('Erro ao tentar validar o acesso').Status(404);
    exit;
  end;
  lJson := TJSONObject.Create;
  lJson.AddPair('horas', TJSONNumber.Create(lHora));
  lJson.AddPair('token', TJOSE.SHA256CompactToken('Alessandro', JWT));
  Res.Send(lJson);
end;

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse);
var
  lUsuario: TUserDTO;
  lUser: TUser;
begin
  lUsuario := TUserDTO.New.JsonToObject(Req.Body);
  lUsuario.Id := TServices<TUser>.New.Insert(lUsuario.Convert).Id;
  Res.Send<TJsonObject>(lUsuario.ToJSON);
end;

procedure APagar(Req: THorseRequest; Res: THorseResponse);
begin
  try
    TServices<TUser>.New.Delete(Req.Params['id'].ToInteger);
    Res.Status(204);
  except
    Res.Status(400);
  end;
end;

procedure BuscarPorId(Req: THorseRequest; Res: THorseResponse);
var
  lDto: TUserDTO;
begin
  lDto := TServices<TUser>.New.Find(Req.Params['id'].ToInteger).Convert;
  Res.Send<TJSONObject>(lDTO.ToJSON);
end;

procedure ListarTodos(Req: THorseRequest; Res: THorseResponse);
var
  lDTO: TObjectList<TUserDTO>;
begin
  lDTO := TUser.New.Convert(TServices<TUser>.New.FindAll);
  Res.Send<TJSONArray>(TUserDTO.New.ListToJSonArray(lDto));
end;

procedure Registery(App: THorse);
begin
  App.Post('/login', Login);
  App.AddCallback(Autorizacao()).Get('/autorizado',Autorizado);
  App.AddCallback(Autorizacao()).Get('/usuarios/:id', BuscarPorId);
  App.AddCallback(Autorizacao()).Get('/usuarios', ListarTodos);
  App.AddCallback(Autorizacao()).Post('/usuarios', Cadastrar);
  App.AddCallback(Autorizacao()).Delete('/usuarios/:id/apagar', APagar);
end;

end.
