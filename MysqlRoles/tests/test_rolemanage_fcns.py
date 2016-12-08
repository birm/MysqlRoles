from MysqlRoles import RoleManage

def test_default_init():
    rm = RoleManage("localhost")

def test_update_users():
    """Checks the basic functionality of RoleManage on a client."""
    rm = RoleManage("localhost")
    rm.update_users()
