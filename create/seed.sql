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
insert into UserGroup (Name) values ("Audit");
insert into UserGroup (Name) values ("Development");
insert into UserGroup (Name) values ("Testing");
insert into UserGroup (Name) values ("Reporting");
insert into UserGroup (Name) values ("Admin");

--host groups
insert into HostGroup (Name) values ("all");
insert into HostGroup (Name) values ("dev_stack");
insert into HostGroup (Name) values ("preprod");
insert into HostGroup (Name) values ("prod");
insert into HostGroup (Name) values ("report");

--permission types
-- do later

--access grants
insert into Access values ("Audit", "Audit", "all", "read");
insert into Access values ("Development", "Development", "dev_stack", "schemachanges");
insert into Access values ("Testing", "Testing", "dev_stack", "readwrite");
insert into Access values ("Reporting", "Reporting", "all", "readfile");
insert into Access values ("Admin", "Admin", "all", "all");
