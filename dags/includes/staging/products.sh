path=$HOME/xsql
if [ -d $path ]; then 
	cd $HOME/xsql/carpenter/ 
    	echo "TO RUN DBT"
    	poetry run dbt run --models staging.stg_products
    	echo "FINISH RUN DBT"
fi