set -x
export

cd mapi-kata
bash setup.sh
cd -

bundle
bundle exec rails s -p 12346 -d -e development

cd mapi-kata
bash run.sh
RETVAL=$?
cd -

kill `cat tmp/pids/server.pid`

if [ $RETVAL -ne 0 ]
then
    ls -al log
    cat log/development.log
fi

exit $RETVAL
