set -x

bundle
bundle exec rails s -p 12346 -d

cd mapi-kata
bundle
bundle exec ruby db_setup.rb
bundle exec rake
RETVAL=$?
cd -

kill `cat tmp/pids/server.pid`
exit $RETVAL
