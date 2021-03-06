template "/tmp/config.conf" do
  cookbook "nginx-app"
  source "silex.conf.erb"
  mode node["testdata"]["mode"]
  owner node["testdata"]["owner"]
  group node["testdata"]["group"]
  variables(
    :php_user => node["testdata"]["php_user"],
    :domain_name => node["testdata"]["domain_name"],
    :doc_root => node["testdata"]["doc_root"],
    :access_log => node["testdata"]["access_log"],
    :nginx_extra => node["testdata"]["nginx_extra"],
    :default_router => node["testdata"]["default_router"],
    :upstream => node["testdata"]["upstream"],
    :db_conf => node["testdata"]["db_conf"],
    :domain_conf => node["testdata"]["domain_conf"],
    :env_conf => node["testdata"]["env_conf"],
    :routes_enabled => node["testdata"]["routes_enabled"],
    :routes_denied => node["testdata"]["routes_denied"],
    :htpasswd => node["testdata"]["htpasswd"]
  )
end
