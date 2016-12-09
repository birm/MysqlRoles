from MysqlRoles import RoleManage

def test_default_init():
    rm = RoleManage("127.0.0.1")

def test_update_users():
    """Checks the basic functionality of RoleManage on a client."""
    rm = RoleManage("127.0.0.1")
    rm.update_users()
