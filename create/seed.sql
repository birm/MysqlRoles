-- user creation
insert into user values ("%","Alan","mysql_native_password", password("Alan"));
insert into user values ("%","Danice","mysql_native_password", password("Danice"));
insert into user values ("%","Terry","mysql_native_password", password("Terry"));
insert into user values ("%","Rachel","mysql_native_password", password("Rachel"));
insert into user values ("%","Sam","mysql_native_password", password("Sam"));

-- db hosts
insert into host values ("report", "report", "main report host");
insert into host values ("staging", "staging", "main staging host");
insert into host values ("testing", "testing", "main testing host");
insert into host values ("cert", "cert", "main cert host");
insert into host values ("prod", "prod", "main prod host");
insert into host values ("ops", "ops", "main ops host");

-- user groups
insert into user_group (Name) values ("Audit");
insert into user_group (Name) values ("Development");
insert into user_group (Name) values ("Testing");
insert into user_group (Name) values ("Reporting");
insert into user_group (Name) values ("Admin");

--host groups
insert into host_group (Name) values ("all");
insert into host_group (Name) values ("dev_stack");
insert into host_group (Name) values ("preprod");
insert into host_group (Name) values ("prod");
insert into host_group (Name) values ("report");

--permission types
-- do later

--access grants
insert into access values ("Audit", "Audit", "all", "read");
insert into access values ("Development", "Development", "dev_stack", "schemachanges");
insert into access values ("Testing", "Testing", "dev_stack", "readwrite");
insert into access values ("Reporting", "Reporting", "all", "readfile");
insert into access values ("Admin", "Admin", "all", "all");
