Welcome to MysqlRoles's documentation!
======================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:


Run from Command line
=====================

Initialize Central Database
---------------------------

Use::

   python -m MysqlRoles init rbac

to initialize a server named rbac to use MysqlRoles.

.. note::
   The argument is optional, and defaults to 127.0.0.1


Initialize Central Database
---------------------------

Use::

   python -m MysqlRoles update rbac db-1

to update a server named db-1 to match the central server named rbac.

.. note::

   The second argument is optional, and defaults to 127.0.0.1

Seed Central Database
---------------------------

Use::

   python -m MysqlRoles seed rbac

to seed the sample values given into a host named rbac.

.. warning::

   Do not use this command in any production environment.

.. note::

   The argument is optional, and defaults to 127.0.0.1

MysqlRoles package
==================

MysqlRoles.RoleManage module
----------------------------

.. automodule:: MysqlRoles.RoleManage
    :members:
    :undoc-members:
    :show-inheritance:

MysqlRoles.RoleServ module
--------------------------

.. automodule:: MysqlRoles.RoleServ
    :members:
    :undoc-members:
    :show-inheritance:

MysqlRoles.Run module
---------------------

.. automodule:: MysqlRoles.Run
    :members:
    :undoc-members:
    :show-inheritance:


* :ref:`genindex`
* :ref:`search`
