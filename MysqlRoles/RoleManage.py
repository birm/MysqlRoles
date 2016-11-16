import pymysql

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

    def user_check(self):
        """
        Run a check against the host for consistency, reporting differences.
        """
        # users missing on client
        # users on server but not client
        # permission differences for matches
        pass

    def update_users(self):
        """
        Make the user inserts to add to the client, and add them.
        """
        pass

    def cli(self):
        """
        Interact with command line.
        """
        pass
