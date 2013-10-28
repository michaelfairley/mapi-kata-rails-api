set -x

cd mapi-kata
bash setup.sh
cd -

bundle
bundle exec rails s -p 12346 -d

cd mapi-kata
bash run.sh
RETVAL=$?
cd -

kill `cat tmp/pids/server.pid`

if [ $RETVAL -ne 0 ]
then
    cat log/development.log
fi

exit $RETVAL
