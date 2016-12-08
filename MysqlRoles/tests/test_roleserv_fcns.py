from MysqlRoles import RoleServ

def test_basic_init():
    rs = RoleServ()

def test_create_tables():
    rs = RoleServ()
    rs.create_tables()
    rs.test_seed_tables()
