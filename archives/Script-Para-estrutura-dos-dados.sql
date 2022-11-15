/*
 Criando a estrutura para o microserviço que irá tratar das autenticações 
 */

CREATE SCHEMA if not exists autenticacao;

CREATE TABLE if not exists autenticacao.usuarios (
	id bigserial NOT NULL,
	nome varchar(100) NULL,
	cpf varchar(100) NULL,
	endereco varchar(100) NULL,
	email varchar(100) NULL,
	telefone varchar(100) NULL,
	datacadastro timestamp NULL DEFAULT now(),
	senha varchar(100) NULL,
	CONSTRAINT usuarios_pk PRIMARY KEY (id)
);

/*
 Criando a estrutura para o microserviço que irá tratar dos cadastros bases 
 */

CREATE SCHEMA if not exists cadastros;

CREATE TABLE if not exists cadastros.categorias (
	id bigserial NOT NULL,
	descricao varchar(100) NULL,
	CONSTRAINT categoria_pk PRIMARY KEY (id)
);

CREATE TABLE if not exists cadastros.pessoas (
	id bigserial NOT NULL,
	nome varchar(100) NULL,
	email varchar(100) NULL,
	telefone varchar(100) NULL,
	datacadastro timestamp NOT NULL DEFAULT now(),
	CONSTRAINT pessoa_pk PRIMARY KEY (id)
);

CREATE TABLE if not exists cadastros.clientes (
	id bigserial NOT NULL,
	id_pessoa int8 NOT NULL,
	tipo varchar(100) NOT NULL,
	cpfcnpj varchar(100) NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (id),
	CONSTRAINT clientes_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['FISICA'::character varying, 'JURIDICA'::character varying])::text[])))
);


ALTER TABLE cadastros.clientes ADD CONSTRAINT clientes_fk FOREIGN KEY (id_pessoa) REFERENCES cadastros.pessoas(id) ON DELETE CASCADE;

CREATE TABLE if not exists cadastros.endereco (
	id bigserial NOT NULL,
	id_pessoa int8 NOT NULL,
	logradouro varchar(100) NULL,
	numero varchar(100) NULL,
	complemento varchar(100) NULL,
	cidade varchar(100) NULL,
	bairro varchar(100) NULL,
	estado varchar(100) NULL,
	tipo varchar(100) NOT NULL,
	CONSTRAINT endereco_check CHECK (((tipo)::text = ANY ((ARRAY['COMERCIAL'::character varying, 'RESIDENCIAL'::character varying])::text[]))),
	CONSTRAINT endereco_pk PRIMARY KEY (id)
);


ALTER TABLE cadastros.endereco ADD CONSTRAINT endereco_fk FOREIGN KEY (id_pessoa) REFERENCES cadastros.pessoas(id) ON DELETE CASCADE;

CREATE TABLE if not exists cadastros.produtos (
	id bigserial NOT NULL,
	descricao varchar(100) NULL,
	preco numeric(17, 2) NULL,
	idcategoria int8 NOT NULL,
	CONSTRAINT produto_pk PRIMARY KEY (id)
);

ALTER TABLE cadastros.produtos ADD CONSTRAINT produtos_fk FOREIGN KEY (idcategoria) REFERENCES cadastros.categorias(id) ON DELETE CASCADE;

/*
 Criando a estrutura para o microserviço que irá tratar das vendas de vendas 
 */

CREATE SCHEMA if not exists vendas;

CREATE TABLE if not exists vendas.pedidos (
	id bigserial NOT NULL,
	cliente int8 NOT NULL,
	dataemissao timestamp NULL DEFAULT now(),
	valortotal numeric(17, 2) NULL DEFAULT 0
);

CREATE TABLE if not exists vendas.pedidoitens (
	id_pedido int8 NOT NULL,
	produto int8 NOT NULL,
	quantidade int4 NOT NULL DEFAULT 1,
	valorunitario numeric(17, 2) NULL DEFAULT 0,
	valortotal numeric(17, 2) NULL DEFAULT 0,
	item int4 NULL
);