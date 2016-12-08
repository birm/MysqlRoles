from MysqlRoles import RoleServ

rs=RoleServ()

def test_create_tables():
    rs.create_tables()
    rs.test_seed_tables()
