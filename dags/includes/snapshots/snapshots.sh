path=$HOME/xsql
if [ -d $path ]; then 
	cd $HOME/xsql/carpenter/ 
    	echo "TO RUN DBT"
    	poetry run dbt snapshot
    	echo "FINISH RUN DBT"
fi

