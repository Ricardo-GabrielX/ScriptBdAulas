drop table empregado;
drop table departamento;
drop table cargo1;
drop table localizacao;

create table localizacao
(idlocalizacao  int not null
,endereco    varchar2(40) not null
,CEP         varchar2(8)
,cidade      varchar2(30) not null
,UF          varchar2(2)
,pais        varchar2(30)
,constraint pk_localizacao primary key (idlocalizacao));

create table departamento
(iddepto    int not null
,nomedepto    varchar2(30) not null
,idlocalizacao  int
,constraint pk_departamento primary key (iddepto)
,constraint fk_depto_location foreign key (idlocalizacao) references localizacao (idlocalizacao)
);

create table cargo1
(idcargo   int  not null
,nomecargo varchar2(35) not null
,minsalario numeric(10,2)
,maxsalario numeric(10,2)
,constraint pk_cargo1 primary key (idcargo));

create table empregado
(idempregado   int      not null
,primeiro_nome varchar2(20)  not null
,ultimo_nome   varchar2(25)  not null
,email         varchar2(25)
,telefone      varchar2(20)
,dtadmissao    date      not null
,idcargo     int not null
,salario     number(10,2)
,perccomissao  numeric(2,2)
,idgerente     int
,iddepto       int
,constraint pk_empregado primary key (idempregado)
,constraint fk_emp_gerente foreign key (idgerente) references empregado (idempregado)
,constraint fk_emp_depto foreign key (iddepto) references departamento (iddepto)
,constraint fk_emp_cargo foreign key (idcargo) references cargo1 (idcargo))

