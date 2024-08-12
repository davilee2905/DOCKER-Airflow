# FROM apache/airflow:2.9.3-python3.10

# WORKDIR /home/davi/prj_python/airflow

# COPY ./dags /home/davi/prj_python/airflow/dags
# COPY ./requirements.txt /home/davi/prj_python/airflow/requirements.txt

# RUN pip install --no-cache-dir -r requirements.txt

# EXPOSE 8080

# CMD ["bash", "-c", "airflow db init && airflow webserver --port 8080 & airflow scheduler"]

FROM apache/airflow:2.9.3-python3.10

WORKDIR /opt/airflow

COPY ./dags /opt/airflow/dags
COPY ./requirements.txt /opt/airflow/requirements.txt

RUN airflow db init
RUN chown -R airflow:airflow /opt/airflow
RUN chmod -R 755 /opt/airflow

CMD ["bash", "-c", "airflow scheduler"]
EXPOSE 8080
