name "app_server"

description "AppServer"

run_list([
  "recipe[java::sun]"
])


default_attributes "java" => {
  "install_flavor" => "sun"
}