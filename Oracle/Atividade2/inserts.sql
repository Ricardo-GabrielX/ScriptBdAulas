insert into localizacao values
(1400,'Rua Jabber da Silva','18120324','Santos','SP','Brasil');
insert into localizacao values
(1401,'Rua Charada','18111324','São Paulo','SP','Brasil');
insert into localizacao values 
(1402,'Boulevard Braguinha','18400440','Sorocaba','SP','Brasil');

insert into departamento values (10,'Administração',1401);
insert into departamento values (20,'Marketing',1401);
insert into departamento values (50,'Almoxarifado',1402);
insert into departamento values (60,'TI',1401);
insert into departamento values (80,'Vendas',1400);
insert into departamento values (90,'Diretoria',1401);
insert into departamento values (110,'Contabilidade',1401);
insert into departamento values (190,'RH',1401);

insert into cargo1 values (1,'Presidente',20000,40000);
insert into cargo1 values (2,'Vice-Presidente',15000,30000);
insert into cargo1 values (3,'Assistente Administrativo',3000,6000);
insert into cargo1 values (4,'Contador',8200,16000);
insert into cargo1 values (5,'Gerente de Vendas',10000,20000);
insert into cargo1 values (6,'Representante de Vendas',6000,12000);
insert into cargo1 values (7,'Gerente de Estoque',5500,8500);
insert into cargo1 values (8,'Almoxarife',2000,5000);
insert into cargo1 values (9,'Programador',4000,10000);
insert into cargo1 values (10,'Gerente de Marketing',9000,15000);

insert into empregado values (100,'Steven','King','SKING','5554433','17/06/1987',1,24000,null,null,90);
insert into empregado values (101,'Neena','Carr','NCARR','5554434','21/09/1989',2,17000,null,100,90);
insert into empregado values (102,'Lex','de Haan','LHAAN','5554435','13/01/1993',2,17000,null,100,90);
insert into empregado values (103,'Alexander','Hunold','AHUNOLD','5554411','03/01/1990',9,9000,null,102,60);
insert into empregado values (104,'Bruce','Wane','BWANE','5554111','21/05/1991',9,6000,null,103,60);
insert into empregado values (107,'Diana','Max','DMAX','5554433','07/02/1999',9,4200,null,103,60);
insert into empregado values (124,'Kevin','Keving','KKEVING','1154433','16/11/1999',7,5800,null,100,50);
insert into empregado values (141,'Trenna','Rajs','TRAJS','2354433','17/10/1995',8,3500,null,124,50);
insert into empregado values (142,'Curtis','Daves','CDAVES','3354433','29/01/1997',8,3100,null,124,50);
insert into empregado values (143,'Roni','Matos','RMATOS','224433','15/03/1998',8,2600,null,124,50);
insert into empregado values (144,'Pedro','Vargas','PVARGAS','4444433','09/07/1998',8,2500,null,124,50);
insert into empregado values (149,'Eleni','Silva','ESILVA','1154433','29/01/2000',5,10500,0.2,100,80);
insert into empregado values (174,'Elen','Abel','EABEL','5554222','11/05/1996',6,11000,0.3,149,80);
insert into empregado values (176,'Jonatan','Tailor','JTAILOR','5511133','24/03/1998',6,8600,0.2,149,80);
insert into empregado values (178,'Kimber','Grant','KGRANT','5554499','24/05/1999',6,7000,0.15,149,null);
insert into empregado values (200,'Jeniffer','Walla','JWALLA','9999433','17/09/1987',3,4400,null,101,10);
insert into empregado values (201,'Michael','Lutz','MLUTZ','9999999','17/02/1996',10,13000,null,100,20);
insert into empregado values (202,'Pat','Fay','PFAY','4444433','17/08/1997',3,6000,null,201,20);
insert into empregado values (205,'Shirley','Ma','SMA','1154433','07/06/1994',4,12000,null,101,110);
insert into empregado values (206,'Willian','Cardoso','WCARDOSO','7754433','07/06/1994',3,8300,null,205,110);
