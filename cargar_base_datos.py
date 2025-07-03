import mysql.connector
import os

def ejecutar_sql_desde_archivo(archivo_sql, conexion):
    ruta_base = os.path.dirname(os.path.abspath(__file__))  
    ruta_archivo = os.path.join(ruta_base, archivo_sql)     

    with open(ruta_archivo, 'r', encoding='utf-8') as f:
        sql_script = f.read()

    sentencias = sql_script.split(';')

    cursor = conexion.cursor()
    try:
        for sentencia in sentencias:
            sentencia = sentencia.strip()
            if sentencia: 
                cursor.execute(sentencia)
        conexion.commit()
        print(f"Archivo '{archivo_sql}' ejecutado correctamente.")
    except mysql.connector.Error as err:
        print(f"Error ejecutando '{archivo_sql}': {err}")
    finally:
        cursor.close()


def main():
    config = {
        'user': 'root',
        'password': 'pagola1942', 
        'host': 'localhost',
    }

    try:
        conexion = mysql.connector.connect(**config)
        print("Conexión a MySQL establecida")

        ejecutar_sql_desde_archivo('db_lotus_createTable.sql', conexion)
        ejecutar_sql_desde_archivo('db_lotus_insert.sql', conexion)

    except mysql.connector.Error as err:
        print(f"❌ Error de conexión: {err}")
    finally:
        if conexion.is_connected():
            conexion.close()
            print("Conexión cerrada")

if __name__ == "__main__":
    main()