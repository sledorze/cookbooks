# TODO Cleanup wrapper files... just keep necessary ones !

platform = node[:kernel][:machine]
arch = { "i686" => "32", "x86_64" => "64" }[platform]

source_url = "http://wrapper.tanukisoftware.com/download/#{node[:java_wrapper][:version]}/wrapper-linux-x86-#{arch}-#{node[:java_wrapper][:version]}.tar.gz"


remote_file "/tmp/java_wrapper-#{node[:java_wrapper][:version]}.tar.gz" do
  source source_url
  checksum node[:java_wrapper][:checksum][platform]
  action :create_if_missing
  not_if { `ls -al /opt`.include?("wrapper-linux-x86-#{arch}-#{node[:java_wrapper][:version]}")  }
end


bash "Setting up JavaWrapper #{node[:java_wrapper][:version]}" do
  cwd "/tmp"
  code <<-EOH
    tar -zxf java_wrapper-#{node[:java_wrapper][:version]}.tar.gz -C #{node[:java_wrapper][:dir]}
    rm -f #{node[:java_wrapper][:home]}
    ln -s #{node[:java_wrapper][:dir]}/wrapper-linux-x86-#{arch}-#{node[:java_wrapper][:version]} #{node[:java_wrapper][:home]}
  EOH
  not_if { `ls -al /opt`.include?("wrapper-linux-x86-#{arch}-#{node[:java_wrapper][:version]}")  }
end

environment = File.read('/etc/environment')
unless environment.include? node[:java_wrapper][:home]
  File.open('/etc/environment', 'w') { |f| f.puts environment.gsub(/PATH="/, "PATH=\"#{node[:java_wrapper][:home]}/bin:") }
end
