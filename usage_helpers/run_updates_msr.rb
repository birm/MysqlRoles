centralhost = "rbac"

easy_install_package 'MysqlRoles' do
  action :install
  version :1.0.0
end

# only on your central host
execute 'run_init' do
    command "python -m MysqlRoles init #{centralhost}"
end

# on every host you want to manage
execute 'run_updates' do
    command "python -m MysqlRoles update #{centralhost} node['hostname']"
end
