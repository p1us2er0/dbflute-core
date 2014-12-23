cd ..
ant -f build.xml dist
ant -f build.xml reflect-to-test-active-dockside
ant -f build.xml reflect-to-test-active-hanger
ant -f build.xml reflect-to-test-dbms-mysql
ant -f build.xml reflect-to-test-dbms-postgresql
ant -f build.xml reflect-to-test-dbms-oracle
ant -f build.xml reflect-to-test-dbms-db2
ant -f build.xml reflect-to-test-dbms-sqlserver
ant -f build.xml reflect-to-test-dbms-derby
ant -f build.xml reflect-to-test-dbms-sqlite
ant -f build.xml reflect-to-test-option-compatible10x
ant -f build.xml reflect-to-example-on-springboot
ant -f build.xml reflect-to-example-on-play2java
ant -f build.xml reflect-to-example-with-doma

cd ..
export answer=y

cd ../dbflute-test-active-dockside/dbflute_maihamadb
rm ./log/*.log
. manage.sh replace-schema
. manage.sh jdbc,doc
. manage.sh generate,outside-sql-test,sql2entity
cd ..
mvn -e compile

cd ../dbflute-test-active-hanger/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
. manage.sh load-data-reverse
. manage.sh freegen
. diffworld-test.sh
. syncworld-test.sh
cd ..
mvn -e compile

cd ../dbflute-test-dbms-mysql/dbflute_maihamadb
rm ./log/*.log
. nextdb-renewal.sh
. slave-replace-schema.sh
. manage.sh renewal
cd ../dbflute_resortlinedb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-dbms-postgresql/dbflute_maihamadb
rm ./log/*.log
# not replace-schema because of big data
. manage.sh regenerate
cd ..
mvn -e compile

cd ../dbflute-test-dbms-oracle/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
. diffworld-test.sh
cd ../dbflute_resortlinedb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-dbms-db2/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-dbms-sqlserver/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-dbms-derby/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-test-dbms-sqlite/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile
cd ../dbflute-test-dbms-derby/dbflute_maihamadb
. manage.sh refresh
cd ..

cd ../dbflute-test-option-compatible10x/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-example-on-springboot/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-example-on-play2java/dbflute_maihamadb
rm ./log/*.log
. manage.sh renewal
cd ..
mvn -e compile

cd ../dbflute-example-with-doma/dbflute_domadb
rm ./log/*.log
. manage.sh replace-schema
. manage.sh jdbc
. manage.sh doc
cd ..
mvn -e compile
