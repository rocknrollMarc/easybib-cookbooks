include_recipe "php-fpm::service"

require "open-uri"
package "libicu-dev"
package "autoconf"

version = open("http://pecl.php.net/rest/r/intl/latest.txt").read
release = "intl-#{version}.tgz"
so_file = "/usr/local/lib/php/extensions/no-debug-non-zts-20090626/intl.so"

remote_file "/tmp/#{release}" do
  source "http://pecl.php.net/get/#{release}"
  not_if do
    File.exists?(so_file)
  end
end

execute "tar -zxf /tmp/#{release}"do
  cwd "/tmp"
  only_if do
    File.exists?("/tmp/#{release}")
  end
end

commands = [
  "phpize",
  "./configure",
  "make",
  "cp ./modules/intl.so #{so_file}"
]

commands.each do |command|
  execute "#{command}" do
    cwd "/tmp/intl-#{version}"
    not_if do
      File.exists?(so_file)
    end
  end
end

php_pecl "intl" do
  action :setup
end

service "php-fpm" do
  action :reload
end
