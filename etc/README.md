# README 
- This folder is only for systemd user
- sudo vim /etc/systemd/system/jupyter-server.service


# to setup systemd 
- sudo systemctl daemon-reload
- sudo systemctl status jupyter-server.service
- sudo systemctl start jupyter-server.service
- sudo systemctl stop jupyter-server.service

- sudo systemctl daemon-reload
- sudo systemctl status airflow-server.service
- sudo systemctl start airflow-server.service
- sudo systemctl stop airflow-server.service

- sudo systemctl daemon-reload
- sudo systemctl status airflow-scheduler.service
- sudo systemctl start airflow-scheduler.service
- sudo systemctl stop airflow-scheduler.service