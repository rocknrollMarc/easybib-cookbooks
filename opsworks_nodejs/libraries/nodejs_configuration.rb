module OpsWorks
  module NodejsConfiguration
    def self.npm_install(app_name, app_config, app_root_path)
      if File.exists?("#{app_root_path}/package.json")
        Chef::Log.info("package.json detected. Running npm install.")
        Chef::Log.info(`chown #{app_config[:user]} ~#{app_config[:user]} 2>&1`)
        Chef::Log.info(`sudo su #{app_config[:user]} -c 'cd #{app_root_path} && npm install' 2>&1`)
      end
    end
  end
end
