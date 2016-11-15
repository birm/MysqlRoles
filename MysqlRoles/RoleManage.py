import pymysql

class RoleManage(object):

    """
    RolePush:
        Functions to, from a source of truth, check a DB and make
        the mysql user table match.

        Input:
            host: Address of server to make match the source of truth
            serv: Address of source of Truth server (default: localhost)
    """

    def __init__(self, host, serv="localhost"):
        """
        Get input and set up connections to be used with contexts (with) later.

        Standard dunder/magic method; returns nothing special.
        No special input validation.
        """
        self.serv = serv
        self.central_con = pymysql.connect(host=self.serv,
                                          db='_MysqlRoles')
        self.client_con = pymysql.connect(host=self.serv,
                                          db='mysql')
