Welcome to MysqlRoles's documentation!
======================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:


Run from Command line
=====================

.. note::
   command line tools expect ~/.my.cnf to exist and have access to any host you wish to update

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

Helper Tools
============

Ansible Playbook
----------------
I've created a basic playbook to use MysqlRoles::

    # run_updates_msr.yml
    ---
    - hosts: rbac_central
      sudo: yes

      tasks:
      - name: ensure a stable MysqlRoles is installed
       pip:
          name: MysqlRoles
          state: latest

      - name: initalize the central db
        command: python -m MysqlRoles init inventory_hostname_short

    - hosts: rbac_db_servers
      sudo: yes

      tasks:
      - name: ensure a stable MysqlRoles is installed
        pip:
           name: MysqlRoles
           state: latest

      - name: run the update
        command: python -m MysqlRoles update arg1 inventory_hostname_short
           args:
               central: sys-p1

This file is located at usage_helpers/run_updates_msr.yml

Chef
----
An example of a chef cookbook which would implement this is::

    centralhost = "rbac"

    easy_install_package 'MysqlRoles' do
      action :upgrade
    end

    # only on your central host
    execute 'run_init' do
        command "python -m MysqlRoles init #{centralhost}"
    end

    # on every host you want to manage
    execute 'run_updates' do
        command "python -m MysqlRoles update #{centralhost} node['hostname']"
    end

This file is located at usage_helpers/run_updates_msr.rb

Web UI
------
On the wishlist, but no progress so far.

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
