-- create all tables

drop table if exists company cascade;
drop table if exists supplier cascade;
drop table if exists supply_chain cascade;
drop table if exists lksg_verstoss cascade;

create table company(
company_id int primary key not null,
company_name char varying(100) not null
);

create table lksg_verstoss(
verstoss_id int primary key not null,
verstossart_char char(100) not null
);

create table supplier(
supplier_id int primary key not null,
company_id int not null references company(company_id),
verstoss_id int references lksg_verstoss(verstoss_id)
);

create table supply_chain(
sc_id int primary key not null,
company_id int not null references company(company_id),
supplier_id int not null references supplier(supplier_id)
);

---------------------------------------------------------------------
-- insert all example data

INSERT INTO company (company_id, company_name)
VALUES 
(1, 'Company A'),
(2, 'Company B'),
(3, 'Company C'),
(4, 'Company D'),
(5, 'Company E'),
(6, 'Company F'),
(7, 'Company G'),
(8, 'Company H'),
(9, 'Company I'),
(10, 'Company J');

INSERT INTO supplier (supplier_id, company_id)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

INSERT INTO supply_chain  (sc_id, supplier_id, company_id)
values
(1, 5, 2),
(2, 3, 5),
(3, 1, 7);

INSERT INTO lksg_verstoss  (verstoss_id, verstossart_char)
values
(1, 'Kinderarbeit'),
(2, 'Sklaverei'),
(3, 'kein Arbeitsschutz'),
(0, 'clean');

---------------------------------------------------------------------
-- Select on Suppliers of a Company

SELECT supplier_id
FROM company c
JOIN supply_chain sc  ON sc.company_id = c.company_id
WHERE c.company_id = 2;
