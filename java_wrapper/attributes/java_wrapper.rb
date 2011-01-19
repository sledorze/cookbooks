default[:java_wrapper][:arch]              = { "i686" => "32", "x86_64" => "64" }[node[:kernel][:machine]]

default[:java_wrapper][:version]           = "3.5.4"
default[:java_wrapper][:checksum][:i686]   = "952d3600ff9cd2de9450e04be1ca3e64"
default[:java_wrapper][:checksum][:x86_64] = "cd23290e31f50a673bcf7433efa56a85"

default[:java_wrapper][:dir]         = "/opt"
default[:java_wrapper][:home]        = "/opt/java-wrapper"

