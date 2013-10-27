set -x

rails s -p 12346 -d

cd mapi-kata
bundle
ruby db_setup.rb
rake
RETVAL=$?
cd -

kill `cat tmp/pids/server.pid`
exit $RETVAL
