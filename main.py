from flask import Flask, render_template, url_for, request, session, redirect, g, jsonify, send_file, Response
import requests
import os
import json
import logging
from flask_mysqldb import MySQL
from flask_login import LoginManager
from werkzeug.security import generate_password_hash, check_password_hash
from UserLogin import UserLogin
from flask_cors import CORS

login_manager = LoginManager()
app = Flask(__name__)
CORS(app)
app.logger.setLevel(logging.INFO)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "123456"
app.config["MYSQL_DB"] = "Quest-DB"

mysql = MySQL(app)

app.secret_key = os.urandom(24)


@app.route('/reg', methods=['POST', 'GET'])
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
            cur.execute("INSERT INTO USERS (login,pass,nick,s_quest,s_answer) VALUES (%s,%s,%s,%s,%s)",
                        (reglogin, hesh_newpass, reglogin, squest, sanswer))
            mysql.connection.commit()
            cur.close()
    return render_template('index.html')


@app.route('/', methods=['POST', 'GET'])
def log():
    cur = mysql.connection.cursor()

    if request.method == 'POST':
        session.pop('user', None)
        login = request.form['login']
        password = request.form['password']
        hesh_pass = generate_password_hash(password)
        cur.execute("SELECT * FROM USERS WHERE login = %s", [login])
        res = cur.fetchone()

        if res:
            correct = check_password_hash(res[1], password)
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
        cur.execute(
            "SELECT QUESTS.quest_id, QUESTS.title, COUNT(QUESTIONS.question_id) AS question_count FROM QUESTS JOIN QUESTIONS ON QUESTS.quest_id = QUESTIONS.quest WHERE QUESTS.autor = %s GROUP BY QUESTS.quest_id, QUESTS.title;",
            [session['user']])
        quests = cur.fetchall()
        cur.execute(
            "SELECT quest, title FROM `PROGRESS`,`QUESTS` WHERE PROGRESS.quest = QUESTS.quest_id AND player = %s;",
            [session['user']])
        QProgress = cur.fetchall()
        # print(quests)
        # print(QProgress)
        return render_template('profile.html', data=res, lquests=quests, qprog=QProgress)
    return redirect(url_for('log'))


@app.route('/profile/questdelete/<int:questcode>')
def delquest(questcode):
    if g.user:
        cur = mysql.connection.cursor()
        cur.execute("SELECT autor FROM QUESTS WHERE quest_id = %s", [questcode])
        res = cur.fetchone()
        if session['user'] == res[0]:
            cur.execute("DELETE FROM QUESTS WHERE quest_id = %s", [questcode])
            mysql.connection.commit()
            cur.close()
            return redirect(url_for('profile'))
    return redirect(url_for('log'))


@app.route('/profile/edit', methods=['POST', 'GET'])
def editprofile():
    if g.user:
        if request.method == 'POST':
            newnick = request.form['newnickname']
            newpassword = request.form['newpassword']
            answer = request.form['securityAnswer']
            cur = mysql.connection.cursor()
            cur.execute("SELECT s_answer FROM USERS WHERE login = %s", [session['user']])
            sanswer = cur.fetchone()
            if answer == sanswer[0]:
                newhesh_pass = generate_password_hash(newpassword)
                if newnick != '':
                    cur = mysql.connection.cursor()
                    cur.execute("UPDATE USERS SET nick = %s WHERE login = %s", [newnick, session['user']])
                    mysql.connection.commit()
                    cur.close()
                if newpassword != '':
                    cur = mysql.connection.cursor()
                    cur.execute("UPDATE USERS SET pass = %s WHERE login = %s", [newhesh_pass, session['user']])
                    mysql.connection.commit()
                    cur.close()
        return redirect(url_for('profile'))
    return redirect(url_for('log'))


@app.route('/profile/questdata/<int:questcode>', methods=['GET'])
def playersquest(questcode):
    cur = mysql.connection.cursor()
    cur.execute("SELECT nick FROM PROGRESS,USERS WHERE PROGRESS.player = USERS.login and quest = %s", [questcode])
    res = cur.fetchall()

    result = []
    for row in res:
        result.append({'nick': row[0]})

    return jsonify(result)


@app.route('/profile/del', methods=['POST'])
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
        if ( qcount ):
            return render_template('create.html', count=qcount)
        else:
            return redirect(url_for('log'))
    return redirect(url_for('log'))


@app.route('/create/send', methods=['POST'])
def create_zend():
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
    cur.execute("INSERT INTO QUESTS (title,disc,autor) VALUES (%s,%s,%s)",
                [inf['q_name'], inf['q_disc'], session['user']])
    mysql.connection.commit()
    last_inserted_id = cur.lastrowid
    cur.close()
    # print(lastcreate)

    for d in data:
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO QUESTIONS  (q_text,q_answer,q_hint,q_pic,quest) VALUES (%s, %s,%s, %s, %s)",
                    (d["q_text"], d["q_answer"], d["q_hint"], d["q_pic"], last_inserted_id))
        mysql.connection.commit()
        cur.close()

    return "Done"


@app.route('/create/sendedit', methods=['POST'])
def create_edit():
    JSONdata = request.get_json()  # извлечение JSON данных из тела запроса
    data = json.loads(JSONdata)
    inf = data[0]
    data.pop(0)
    print(inf)
    print(data)
    cur = mysql.connection.cursor()
    cur.execute("UPDATE QUESTS SET title = %s, disc = %s WHERE quest_id = %s",
                [inf['q_name'], inf['q_disc'], inf['q_id']])
    mysql.connection.commit()
    for d in data:
        cur = mysql.connection.cursor()
        cur.execute("UPDATE QUESTIONS SET q_text = %s, q_answer = %s, q_hint = %s,q_pic = %s WHERE question_id = %s",
                    [d['q_text'], d['q_answer'], d['q_hint'], d['q_pic'], d['id']])
        mysql.connection.commit()
        cur.close()

    return "Done"


@app.route('/quest')
def quest():
    if g.user:
        return render_template('quest.html')
    return redirect(url_for('log'))


@app.route('/create/edit/<string:qcount>/<int:questcode>')
def questedit(qcount, questcode):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM QUESTIONS,QUESTS WHERE QUESTIONS.quest = QUESTS.quest_id AND quest = %s", [questcode])
    res = cur.fetchall()

    result_array = []

    for row in res:
        row_array = list(row)
        result_array.append(row_array)

    if g.user == res[0][9] and (qcount >= '4' and qcount <= '32'):
        return render_template('edit.html', count=qcount, qdata=result_array, code=questcode)
    return redirect(url_for('log'))


@app.route('/dropsession')
def dropsession():
    session.pop('user', None)
    return redirect(url_for('log'))


@app.route('/userlogged')
def userloginned():
    user = session['user']
    return jsonify(user)


auth_token = "05dcaa6d-5d71-4f98-a080-5d6841ee6eba"


@app.route('/winquest/<int:questcode>/', methods=['GET'])
def winquest(questcode):
    client_token = request.headers.get('Authorization')
    if client_token == auth_token:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM PROGRESS WHERE player = %s AND quest = %s", (session['user'], questcode))
        res = cur.fetchone()
        if res:
            return redirect(url_for('profile'))
        else:
            cur.execute("INSERT INTO PROGRESS (quest,player) VALUES (%s,%s)",
                        (questcode, session['user']))
            mysql.connection.commit()
            cur.close()
            return redirect(url_for('profile'))
    else:
        return "Доступ запрещен"


@app.before_request
def before_request():
    g.user = None
    if 'user' in session:
        g.user = session['user']


@app.route('/proxy', methods=['GET'])
def proxy():
    # Получение URL изображения из параметра запроса
    image_url = request.args.get('url')

    if not image_url:
        return Response('URL parameter is missing', status=400)

    # Запрос изображения по указанному URL
    response = requests.get(image_url)

    # Проверка успешности запроса изображения
    if response.status_code == 200:
        # Установка заголовков CORS
        headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET',
            'Access-Control-Allow-Headers': 'Content-Type'
        }

        # Отправка ответа с изображением и заголовками CORS
        return Response(response.content, headers=headers, content_type=response.headers['Content-Type'])
    else:
        return Response(f'Failed to fetch image: {response.status_code}', status=400)


if __name__ == "__main__":
    app.run(debug=True)
