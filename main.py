from flask import Flask, render_template, url_for, request,session, redirect,g
import os
from flask_mysqldb import MySQL
from flask_login import LoginManager
from UserLogin import UserLogin

login_manager = LoginManager()
app = Flask(__name__)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "123456"
app.config["MYSQL_DB"] = "Quest-DB"

mysql = MySQL(app)

app.secret_key = os.urandom(24)
# @login_manager.user_loader
# def load_user(user_id):
#     print("load_user")
#     return UserLogin().fromDB(user_id, dbase)


@app.route('/reg',methods = ['POST','GET'])
def reg():

    cur = mysql.connection.cursor()
    if request.method == 'POST':
        reglogin = request.form['reglogin']
        regpassword = request.form['regpassword']
        squest = request.form['securityQuestion[]']
        sanswer = request.form['securityAnswer']
        cur.execute("SELECT * FROM USERS WHERE login = %s", [reglogin])
        res = cur.fetchone()

        if res:
            return 'Пользователь уже существует'
        else:
            cur.execute("INSERT INTO USERS (login,pass,nick,s_quest,s_answer) VALUES (%s,%s,%s,%s,%s)", (reglogin, regpassword, reglogin, squest, sanswer))
            mysql.connection.commit()
            cur.close()
    return render_template('index.html')


@app.route('/',methods = ['POST','GET'])
def log():
    cur = mysql.connection.cursor()

    if request.method == 'POST':
        session.pop('user', None)
        login = request.form['login']
        password = request.form['password']
        cur.execute("SELECT * FROM USERS WHERE login = %s", [login])
        res = cur.fetchone()

        if res:
            if password == res[1]:
                session['user'] = login
                return redirect(url_for('profile'))
            else:
                return 'Ошибка авторизации'
        else:
            return 'Пользователь не обнаружен'
    return render_template('index.html')




@app.route('/profile')
def profile():
    if g.user:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM USERS WHERE login = %s", [session['user']])
        res = cur.fetchone()
        return render_template('profile.html', data = res)
    return redirect(url_for('log'))

@app.route('/create')
def create():
    return render_template('create.html')

@app.route('/quest')
def quest():
    return render_template('quest.html')

@app.before_request
def before_request():
    g.user = None
    if 'user' in session:
        g.user = session['user']

@app.route('/dropsession')
def dropsession():
    session.pop('user',None)
    return render_template('index.html')


if __name__ == "__main__":
        app.run(debug=True)