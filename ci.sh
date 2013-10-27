set -x

bundle
bundle exec rails s -p 12346 -d

cd mapi-kata
bash run.sh
RETVAL=$?
cd -

kill `cat tmp/pids/server.pid`
exit $RETVAL
