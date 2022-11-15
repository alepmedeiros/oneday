unit cadastrosapi.backend.controller.usuarios;

interface

uses
  Horse,
  System.SysUtils,
  System.JSON,
  System.Generics.Collections,
  cadastrosapi.backend.services,
  cadastrosapi.backend.utils,
  cadastrosapi.backend.dto.usuario,
  cadastrosapi.backend.model.entity.usuarios,
  cadastrosapi.backend.model.entity.pessoas;

procedure Registery(App: THorse);

implementation

procedure BuscarPorId(Req: THorseRequest; Res: THorseResponse);
var
  lUsuario: TUsuarioDTO;
  lPessoa: TPessoas;
  lUser: TUsuarios;
  a:string;
begin
  lPessoa := TServices<TPessoas>.New.Find(Req.Params['id'].ToInteger);
  lUser := TServices<Tusuarios>.New.Find('id_pessoa', lPessoa.Id);
  lUsuario := lUser.Convert(lPessoa);
  Res.Send<TJSONObject>(lUsuario.ToJSON);
end;

procedure ListarTodos(Req: THorseRequest; Res: THorseResponse);
var
  lUser: TUsuarios;
  lUsers: System.Generics.Collections.TObjectList<Tusuarios>;
  lUsuarios: TObjectList<TUsuarioDTO>;
  lPessoa: TPessoas;
  lPessoas: System.Generics.Collections.TObjectList<TPessoas>;
begin
  lUsers := TServices<TUsuarios>.New.FindAll;
  lPessoas := TServices<TPessoas>.New.FindAll;

  lUsuarios:= TObjectList<TUsuarioDTO>.Create;
  for lUser in lUsers do
  begin
    for lPessoa in lPessoas do
      if lUser.idPessoa=lPessoa.Id then
        lUsuarios.Add(lUser.Convert(lPessoa));
  end;

  Res.Send<TJSONArray>(TUsuarioDTO.New.ListToJsonArray(lUsuarios));
end;

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse);
var
  lUsuario: TUsuarioDTO;
  lUser: TUsuarios;
  lPessoa: TPessoas;
begin
  lUsuario:= TUsuarioDTO.New.JsonToObject(Req.Body);
  lUser := lUsuario.Convert(lPessoa);
  lPessoa := TServices<TPessoas>.New.Insert(lPessoa);
  lUser.idPessoa := lPessoa.Id;
  lUser := TServices<TUsuarios>.New.Insert(lUser);
  lUsuario := lUser.Convert(lPessoa);
  Res.Send<TJsonObject>(lUsuario.ToJSON);
end;

procedure APagar(Req: THorseRequest; Res: THorseResponse);
begin
  try
    TServices<TPessoas>.New.Delete(Req.Params['id']);
    Res.Status(204);
  except
    Res.Status(400);
  end;
end;

procedure Registery(App: THorse);
begin
  App.Get('/usuarios/:id', BuscarPorId);
  App.Get('/usuarios', ListarTodos);
  App.Post('/usuarios', Cadastrar);
  App.Delete('/usuarios/:id/apagar', APagar);
end;

end.
