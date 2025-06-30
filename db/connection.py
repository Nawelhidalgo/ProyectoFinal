import mysql.connector
from flask import current_app

def get_db_connection():
    config = current_app.config
    conn = mysql.connector.connect(
        host=config['MYSQL_HOST'],
        user=config['MYSQL_USER'],
        password=config['MYSQL_PASSWORD'],
        database=config['MYSQL_DB']
    )
    return conn