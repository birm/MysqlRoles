from MysqlRoles import RoleManage
from MysqlRoles import RoleServ
import pymysql


class Run(object):

    @staticmethod
    def parse(self, args):
        """
        Parse arguments given to CLI into commands to run.
        """
        # -- Desired Commands
        # init (address/name for central server) -- creates empty tables
        # seed (address/name for central server) -- seeds with test info
        # update (address/name for central server) (address/name for host)
        # -- updates the host as requested
        helpstr = \
        """Expected Command Line Usage of MysqlRoles:
        init (address/name for central server)
            creates empty tables
        seed (address/name for central server)
            seeds with test info
        update (address/name for central server) (address/name for host)
            updates the host as requested."""
        if len(args) < 1:
            print(helpstr)
            return 1
        elif args[0].lower() == "init":
            if len(args) != 2:
                print("init expects a hostname for a central server to init")
                return 1
            else:
                cent = Run.net_test(args[1])
                rs = RoleServ(cent)
                rs.create_tables()
                print "created tables on %s".format(cent)
                return 0
        elif args[0].lower() == "seed":
            if len(args) != 2:
                print("seed expects a hostname for a central server to seed")
                return 1
            else:
                cent = Run.net_test(args[1])
                rs = RoleServ(cent)
                rs.test_seed_tables()
                print "test seeded on %s".format(cent)
                return 0
        elif args[0].lower() == "update":
            if len(args) != 3:
                print("init expects a hostname for a central server to reference and a client to update")
                return 1
            else:
                cent = Run.net_test(args[1])
                client = Run.net_test(args[2])
                rm = RoleServ(cent, client)
                rm.update_users()
                print "updated users on %s from %s".format(client, cent)
                return 0
        else:
            print(helpstr)
            return 1

    @staticmethod
    def net_test(self, host):
        """
        Determine if a host is accessible before doing anything.

        Returns the host name back if the host is up and is able to connect with mysql.
        To fix this issue, try:
        - Update your my.cnf with credentials
        - Start a mysql instance on the host
        """
        try:
            pymysql.connect(host=host, db='mysql')
            return host
        except pymysql.err.OperationalError:
            return False
        pass