program cadastros;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  cadastros.model.entity.categoria in 'src\model\entity\cadastros.model.entity.categoria.pas',
  cadastros.model.entity.cliente in 'src\model\entity\cadastros.model.entity.cliente.pas',
  cadastros.model.entity.contato in 'src\model\entity\cadastros.model.entity.contato.pas',
  cadastros.model.entity.endereco in 'src\model\entity\cadastros.model.entity.endereco.pas',
  cadastros.model.entity.pessoa in 'src\model\entity\cadastros.model.entity.pessoa.pas',
  cadastros.model.entity.produto in 'src\model\entity\cadastros.model.entity.produto.pas',
  cadastros.model.entity.usuario in 'src\model\entity\cadastros.model.entity.usuario.pas';

begin

end.
