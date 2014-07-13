rpm_package "http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm" do
  action :install
end

yum_package "newrelic-sysmond" do
  action :install
end

execute "newrelic-configuration" do
  command "nrsysmond-config --set license_key=#{node[:monit_config][:newrelic_license]}"
  action :nothing
end


execute "start newrelic server" do
  command '/etc/init.d/newrelic-sysmond start'
  action :nothing
end


