from flask import Flask, render_template, url_for, request,session, redirect,g
import os
import json
from flask_mysqldb import MySQL
from flask_login import LoginManager
from werkzeug.security import generate_password_hash,check_password_hash
from UserLogin import UserLogin

login_manager = LoginManager()
app = Flask(__name__)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "123456"
app.config["MYSQL_DB"] = "Quest-DB"

mysql = MySQL(app)

app.secret_key = os.urandom(24)



@app.route('/reg',methods = ['POST','GET'])
def reg():

    cur = mysql.connection.cursor()
    if request.method == 'POST':
        reglogin = request.form['reglogin']
        regpassword = request.form['regpassword']
        hesh_newpass = generate_password_hash(regpassword)
        squest = request.form['securityQuestion[]']
        sanswer = request.form['securityAnswer']
        cur.execute("SELECT * FROM USERS WHERE login = %s", [reglogin])
        res = cur.fetchone()

        if res:
            return 'Пользователь уже существует'
        else:
            cur.execute("INSERT INTO USERS (login,pass,nick,s_quest,s_answer) VALUES (%s,%s,%s,%s,%s)", (reglogin, hesh_newpass, reglogin, squest, sanswer))
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
        hesh_pass = generate_password_hash(password)
        cur.execute("SELECT * FROM USERS WHERE login = %s", [login])
        res = cur.fetchone()
        print(res[1])
        print(hesh_pass)

        if res:
            correct = check_password_hash(res[1], password)
            print(correct)
            if correct:
                session['user'] = login
                return redirect(url_for('profile'))
            else:
                return 'Ошибка авторизации'
        else:
            return 'Пользователь не обнаружен'
    return render_template('index.html', my_variable=g.user)




@app.route('/profile')
def profile():
    if g.user:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM USERS WHERE login = %s", [session['user']])
        res = cur.fetchone()
        return render_template('profile.html', data = res)
    return redirect(url_for('log'))

@app.route('/profile/edit',methods = ['POST'])
def editprofile():
    if g.user:
        if request.method == 'POST':
            newnick = request.form['newnickname']
            newpassword = request.form['newpassword']
            if newnick != '':
                cur = mysql.connection.cursor()
                cur.execute("UPDATE USERS SET nick = %s WHERE login = %s", [newnick, session['user']])
                mysql.connection.commit()
                cur.close()
            if newpassword != '':
                cur = mysql.connection.cursor()
                cur.execute("UPDATE USERS SET pass = %s WHERE login = %s", [newpassword, session['user']])
                mysql.connection.commit()
                cur.close()
        return redirect(url_for('profile'))
    return redirect(url_for('log'))


@app.route('/profile/del',methods = ['POST'])
def delprofile():
    if g.user:
        if request.method == 'POST':
            cur = mysql.connection.cursor()
            cur.execute("DELETE FROM USERS WHERE login = %s", [session['user']])
            mysql.connection.commit()
            cur.close()
    return redirect(url_for('dropsession'))


@app.route('/create/<string:qcount>')
def create(qcount):
    if g.user:
        if qcount == '16' or qcount == '24' or qcount == '32':
            return render_template('create.html', count=qcount)
        else:
            return redirect(url_for('log'))
    return redirect(url_for('log'))

@app.route('/create/send', methods=['POST'])
def process_json():
    JSONdata = request.get_json()  # извлечение JSON данных из тела запроса
    data = json.loads(JSONdata)
    inf = data[0]
    data.pop(0)
    # print(inf)
    # print(data)
    # print(inf['q_name'])
    # print(inf['q_disc'])
    # print(session['user'])
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO QUESTS (title,disc,autor) VALUES (%s,%s,%s)", [inf['q_name'],inf['q_disc'], session['user']])
    mysql.connection.commit()
    last_inserted_id = cur.lastrowid
    cur.close()
    # print(last_inserted_id)

    for d in data:
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO QUESTIONS  (q_text,q_answer,q_hint,q_pic,room,quest) VALUES (%s, %s,%s, %s,%s, %s)", (d["q_text"], d["q_answer"], d["q_hint"], d["q_pic"], d["room"], last_inserted_id))
        mysql.connection.commit()
        cur.close()

    return "Done"



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
    return redirect(url_for('log'))


if __name__ == "__main__":
        app.run(debug=True)