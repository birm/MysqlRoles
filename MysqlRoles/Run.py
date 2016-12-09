from MysqlRoles import RoleManage
from MysqlRoles import RoleServ


class Run(object):
  def parse(self):
    """
    Parse arguments given to CLI into commands to run.
    """
    # -- Desired Commands
    # Run init (address/name for central server) -- creates empty tables
    # Run seed (address/name for central server) -- seeds with test info
    # Run update (address/name for central server) (address/name for host) -- updates the host as requested
    pass
    
