#!/bin/sh
CAFE_PATH=`pwd`
cd web

echo "development:" > config/database.yml
echo "  adapter: mysql2" >> config/database.yml
echo "  encoding: utf8" >> config/database.yml
echo "  reconnect: false" >> config/database.yml
echo "  database: $database" >> config/database.yml 
echo "  pool: 5" >> config/database.yml
echo "  username: $username" >> config/database.yml
echo "  password: $password" >> config/database.yml
echo "  host: localhost" >> config/database.yml
echo "  socket: /var/run/mysqld/mysqld.sock" >> config/database.yml
echo "" >> config/database.yml
echo "production:" >> config/database.yml
echo "  adapter: mysql2" >> config/database.yml
echo "  encoding: utf8" >> config/database.yml
echo "  reconnect: false" >> config/database.yml
echo "  database: $database" >> config/database.yml 
echo "  pool: 5" >> config/database.yml
echo "  username: $username" >> config/database.yml
echo "  password: $password" >> config/database.yml
echo "  host: localhost" >> config/database.yml
echo "  socket: /var/run/mysqld/mysqld.sock" >> config/database.yml

echo "Object.instance_eval{remove_const :GRADER_ROOT_DIR}" >> config/initializers/cafe_grader_config.rb 
echo "Object.instance_eval{remove_const :GRADING_RESULT_DIR}" >> config/initializers/cafe_grader_config.rb
echo "GRADER_ROOT_DIR = '$CAFE_PATH/judge'" >> config/initializers/cafe_grader_config.rb
echo "GRADING_RESULT_DIR = '$CAFE_PATH/judge/result'" >> config/initializers/cafe_grader_config.rb

rake db:migrate