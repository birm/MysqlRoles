from MysqlRoles import RoleServ

def test_basic_init():
    rs = RoleServ()

def test_create_tables():
    rs = RoleServ()
    rs.create_tables()
    rs.test_seed_tables()

def test_client_fcns():
    rs = RoleServ()
    # Norm is the New Guy
    rs.add_user("Norm")
    # norm brought his own host
    rs.add_host("norm_db", "norm_db")
    # norm and his host need groups
    rs.add_host_group("personal")
    rs.add_user_group("personaladmin")
    rs.add_user_group_membership("Norm","personaladmin")
    rs.add_host_group_membership("norm_db","personal")
    # the only thing norm can control is replication
    rs.create_permission("replication")
    rs.add_permission("replication", "Repl_client_priv")
    rs.add_permission("replication", "Repl_slave_priv")
    # and give this access
    rs.add_access("Personal Replication Admin", "personaladmin", "personal", "replication")
