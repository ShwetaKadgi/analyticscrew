import pymysql

con = pymysql.connect(host="analyticscrew.cvbsxpqzg6ft.ap-south-1.rds.amazonaws.com", user="admin",
                      password="qiG6t9WldKpizIYU527S", db="analyticscrew")


def db_login(username, password):
    cur = con.cursor()
    qry = "select username, isadmin, isverified from users where username = '" + \
        username + "' and password = '" + password + "'"
    cur.execute(qry)
    output = list(cur.fetchall())
    verified = 3
    for i in output:
        isadmin = i[1]
        verified = i[2]
    if len(output) > 0 and verified == 1:
        if isadmin == "1":
            return "admin"
        else:
            return "user"
    elif verified == 0:
        return "not"
    elif verified == 2:
        return "rejected"
    else:
        return "no"


def user_register(username, password):
    cur = con.cursor()
    qry = "insert into users(username, password) values('" + \
        username + "', '" + password + "')"
    cur.execute(qry)
    con.commit()


def get_new_users():
    cur = con.cursor()
    qry = "select username, isverified from users where isverified = 0"
    cur.execute(qry)
    output = cur.fetchall()
    return output


def update_user(username, val):
    cur = con.cursor()
    if val == 1:
        qry = "update users set isverified = 1 where username = '" + username + "'"
        cur.execute(qry)
        con.commit()
    else:
        qry = "update users set isverified = 2 where username = '" + username + "'"
        cur.execute(qry)
        con.commit()


def add_history(userid, username, task):
    cur = con.cursor()
    qry = "insert into history(userid, username, tasks) values('" + \
        str(userid) + "', '" + username + "', '" + task + "')"
    cur.execute(qry)
    con.commit()


def get_userid(username, password):
    cur = con.cursor()
    qry = "select id from users where username = '" + \
        username + "' and password = '" + password + "'"
    cur.execute(qry)
    output = cur.fetchall()
    return output[0][0]


def get_history(userid, username):
    cur = con.cursor()
    if username == 'admin':
        qry = "select * from history"
        cur.execute(qry)
        output = cur.fetchall()
        return output
    else:
        qry = "select * from history where userid = '" + \
            str(userid) + "' and username = '" + username + "'"
        cur.execute(qry)
        output = cur.fetchall()
        return output


def addPredictionHistory(userid, name, allocated, completed, appraisal, ontime, complaints, joiningdate, behavior):
    cur = con.cursor()
    qry = "insert into predictionhistory(userid, name, allocateddays, completeddays, appraisal, ontime, complaints, joiningdate, behavior) values('" + userid + "', '" + \
        name + "', '" + allocated + "', '" + completed + "', '" + appraisal + "', '" + \
        ontime + "', '" + complaints + "', '" + joiningdate + "', '" + behavior + "')"
    cur.execute(qry)
    con.commit()


def getPredictionHistory(userid):
    cur = con.cursor()
    qry = "select * from predictionhistory where userid = '" + \
        str(userid) + "'"
    cur.execute(qry)
    output = cur.fetchall()
    return output


# print(get_history(8, 'sakib'))
# print(get_userid('admin', 'qwerty'))
# addPredictionHistory('sakib', '4', '5', '5', 'Yes', '0', '1-2-2012', 'Good')
# update_user("demo")
# data = get_new_users()
# for i in data:
#     print(i[0])
# print(db_login("sakib", "qwerty"))
# user_register("sakib", "qwerty")
# update_user("testing2", 0)
# print(db_login("admin","123"))
