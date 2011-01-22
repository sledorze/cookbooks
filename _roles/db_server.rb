name "db_server"

description "DbServer"

run_list([
  "recipe[mysql::server]"
])