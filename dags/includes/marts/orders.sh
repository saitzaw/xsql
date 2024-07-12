path=$HOME/xsql
if [ -d $path ]; then 
	cd $HOME/xsql/carpenter/ 
    echo "TO RUN DBT"
    poetry run dbt run --models marts.orders
    echo "FINISH RUN DBT"
fi