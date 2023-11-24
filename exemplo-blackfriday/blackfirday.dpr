program blackfirday;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  cadastroapi.backend.utils in 'src\utils\cadastroapi.backend.utils.pas',
  pedidosapi.backend.utils in 'src\utils\pedidosapi.backend.utils.pas',
  userapi.backend.utils in 'src\utils\userapi.backend.utils.pas',
  userapi.backend.services in 'src\services\userapi.backend.services.pas',
  useapi.backend.resource.autorizacao in 'src\resource\useapi.backend.resource.autorizacao.pas',
  userapi.backend.resource.connect in 'src\resource\userapi.backend.resource.connect.pas',
  cadastroapi.backend.model.enums in 'src\model\cadastroapi.backend.model.enums.pas',
  cadastroapi.backend.model.entity.categoria in 'src\model\entity\cadastroapi.backend.model.entity.categoria.pas',
  cadastroapi.backend.model.entity.cliente in 'src\model\entity\cadastroapi.backend.model.entity.cliente.pas',
  cadastroapi.backend.model.entity.contatos in 'src\model\entity\cadastroapi.backend.model.entity.contatos.pas',
  cadastroapi.backend.model.entity.endereco in 'src\model\entity\cadastroapi.backend.model.entity.endereco.pas',
  cadastroapi.backend.model.entity.pessoa in 'src\model\entity\cadastroapi.backend.model.entity.pessoa.pas',
  cadastroapi.backend.model.entity.produto in 'src\model\entity\cadastroapi.backend.model.entity.produto.pas',
  pedidosapi.backend.model.entity.pedido in 'src\model\entity\pedidosapi.backend.model.entity.pedido.pas',
  pedidosapi.backend.model.entity.pedidoitens in 'src\model\entity\pedidosapi.backend.model.entity.pedidoitens.pas',
  userapi.backend.model.entity.usuarios in 'src\model\entity\userapi.backend.model.entity.usuarios.pas',
  cadastroapi.backend.dto.categoria in 'src\dto\cadastroapi.backend.dto.categoria.pas',
  cadastroapi.backend.dto.cliente in 'src\dto\cadastroapi.backend.dto.cliente.pas',
  cadastroapi.backend.dto.contato in 'src\dto\cadastroapi.backend.dto.contato.pas',
  cadastroapi.backend.dto.endereco in 'src\dto\cadastroapi.backend.dto.endereco.pas',
  cadastroapi.backend.dto.produto in 'src\dto\cadastroapi.backend.dto.produto.pas',
  pedidosapi.backend.dto.pedido in 'src\dto\pedidosapi.backend.dto.pedido.pas',
  pedidosapi.backend.dto.pedidoitens in 'src\dto\pedidosapi.backend.dto.pedidoitens.pas',
  pedidosapi.backend.dto.produto in 'src\dto\pedidosapi.backend.dto.produto.pas',
  userapi.backend.dto.usuario in 'src\dto\userapi.backend.dto.usuario.pas',
  cadastroapi.backend.controller.categoria in 'src\controller\cadastroapi.backend.controller.categoria.pas',
  cadastroapi.backend.controller.cliente in 'src\controller\cadastroapi.backend.controller.cliente.pas',
  cadastroapi.backend.controller.produto in 'src\controller\cadastroapi.backend.controller.produto.pas',
  pedidosapi.backend.controller.pedido in 'src\controller\pedidosapi.backend.controller.pedido.pas',
  userapi.backend.controller in 'src\controller\userapi.backend.controller.pas',
  pedidosapi.bachend.auth.interfaces in 'src\auth\pedidosapi.bachend.auth.interfaces.pas',
  pedidosapi.bachend.auth.impl.httpclient in 'src\auth\impl\pedidosapi.bachend.auth.impl.httpclient.pas',
  commons.backend.connect in 'src\commons\commons.backend.connect.pas',
  commons.backend.services in 'src\commons\commons.backend.services.pas',
  Commons.Middleware.Authentication in 'src\commons\Commons.Middleware.Authentication.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
