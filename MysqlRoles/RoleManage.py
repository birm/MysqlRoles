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
                                          db='_MysqlRoles')
        self.client_con = pymysql.connect(host=self.client,
                                          db='mysql')

    """
    Run a check the host for consistency, reporting differences.
    """

    """
    Make the user inserts to add to the client, and add them.
    """

    """
    Interact with command line.
    """
