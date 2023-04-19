from flask import Flask
from flask_mysqldb import MySQL


app = Flask(__name__)
mysql = MySQL(app)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "123456"
app.config["MYSQL_DB"] = "Quest-DB"

def getUser(user_login):
        cur = mysql.connection.cursor()
        log = cur.execute("SELECT * FROM USERS WHERE login = {user_login} LIMIT 1")
        mysql.connection.commit()
        cur.close()
        if not log:
            print("Not found")
            return False
