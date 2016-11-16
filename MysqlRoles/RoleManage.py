import pymysql
from MysqlRoles.RoleServ import RoleServ

class RoleManage(object):

    """
    RolePush:
        Functions to, from a source of truth, check a DB and make
        the mysql user table match.

        Input:
            client: Address of server to make match the source of truth
            server: Address of source of Truth server (default: localhost)
    """

    def __init__(self, client, server="localhost"):
        """
        Get input and set up connections to be used with contexts (with) later.

        Standard dunder/magic method; returns nothing special.
        No special input validation.
        """
        self.server = server
        self.client = client
        self.central_con = pymysql.connect(host=self.server,
                                          db='_MysqlRoles',
                                          autocommit=True)
        self.client_con = pymysql.connect(host=self.client,
                                          db='mysql',
                                          autocommit=True)
        self.RoleServer = RoleServ()

    def get_users(self):
        """
        Get a list of users managed by this service.

        Returns a list of usernames managed by the service.
        """
        with self.central_con.cursor() as cursor:
            get_users = "select Name from user"
            cursor.execute(get_users)
            result = list(cursor.fetchall())
            return result

    def get_servers(self):
        """
        Get a list of servers managed by this service.

        Returns a list of server addresses managed by the service.
        """
        with self.central_con.cursor() as cursor:
            get_addresses = "select Address from host"
            cursor.execute(get_users)
            result = list(cursor.fetchall())
            return result

    def user_check(self, server):
        """
        Run a check against the host for consistency, reporting differences.
        """
        # get users
        # users missing on client
        # users on client but not server
        return ["missing on client", "missing on server", "ok"]

    def get_privs(self, user, host):
        """
        Get the privs of the user on the specified host.
        """
        # get host groups that touch this host
        # get user groups that touch this user
        # find all access that maps them
        # logical or for each permission
        pass

    def update_users(self, remove=False):
        """
        Make the user inserts to add to the client, and add them.
        """
        for server in self.get_servers():
            users=self.user_check(server)
            # add users missing on client
            if remove:
                # remove users on client but not server

    def cli(self):
        """
        Interact with command line.
        """
        pass
