create database HealthTech
go

use Healthtech
go

create table paciente
(
	cod_paciente int identity(1,1),
	nome varchar(max) not null,
	cpf varchar (15) not null,
	data_nascimento datetime not null,
	telefone varchar(25) not null,
	email varchar (max) not null,
	vulnerabilidade varchar (100) not null,
	primary key (cod_paciente)
)
go

create table medico
(
	crm varchar(15) not null, 
	nome varchar(max) not null,
	cpf varchar (15) not null,
	telefone varchar(25) not null,
	email varchar (max) not null,
	primary key (crm)
)
go

create table convenio
(
	cod_convenio int identity(1,1),
	nome varchar(max) not null,
	preco numeric(10,2) not null,
	empresa varchar (max) not null,
	plano_saude varchar (max) not null,
	primary key (cod_convenio)
)
go

create table especialidade
(
	cod_especialidade int identity(1,1),
	nome varchar(max) not null,
	primary key (cod_especialidade)
)
go

create table medico_especialidade
(
	crm varchar(15) not null references medico (crm),
	cod_especialidade int not null references especialidade(cod_especialidade),
	primary key (crm, cod_especialidade)
)
go

create table paciente_convenio
(
	cod_paciente int not null references paciente (cod_paciente),
	cod_convenio int not null references convenio(cod_convenio),
	primary key (cod_paciente, cod_convenio)
)
go

create table consultorio
(
	cod_consultorio int identity(1,1), 
	nome varchar(max) not null,
	cnpj varchar (15) not null,
	telefone varchar(25) not null,
	email varchar (max) not null,
	preco numeric(10,2) not null,
	primary key (cod_consultorio)
)
go

create table sintomas
(
	cod_sintomas int identity(1,1),
	descricao varchar(max) not null,
	urgencia varchar(max) not null,
	nivel_dor numeric(10,0) not null,
	primary key (cod_sintomas)
)
go

create table consulta
(
	cod_consulta int identity(1,1),
	cod_paciente int not null references paciente (cod_paciente),
	crm varchar(15) not null references medico (crm),
	cod_convenio int not null references convenio(cod_convenio),
	cod_consultorio int not null references consultorio(cod_consultorio),
	preco numeric(10,2) not null,
	data_hora_inicio datetime not null,
	data_hora_final datetime not null,
	primary key (cod_consulta)
)
go

create table consulta_sintomas
(
	cod_consulta int not null references consulta (cod_consulta),
	cod_sintomas int not null references sintomas(cod_sintomas),
	primary key (cod_consulta, cod_sintomas)
)
go