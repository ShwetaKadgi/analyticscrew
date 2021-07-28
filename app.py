from flask import Flask, render_template, url_for, request, redirect
from flask.globals import session
import database as db
from csv import reader
from dateutil.relativedelta import relativedelta
from datetime import datetime
import pickle
import pandas as pd
from collections import Counter

app = Flask(__name__, template_folder='template')
app.secret_key = '1F4453C6EA2C5B454D221285FFFFC'


@app.route("/")
@app.route("/home")
def home():
    return render_template("index.html")


@app.route("/signin_nav")
def signin_nav():
    return render_template("signin.html")


@app.route("/contact_nav")
def contact_nav():
    return render_template("contact.html")


@app.route("/adminhome")
def adminhome():
    if 'username' in session:
        return render_template("adminhome.html", msg=session['username'])
    else:
        return render_template("signin.html")


@app.route("/userhome")
def userhome():
    if 'username' in session:
        return render_template("userhome.html", msg=session['username'])
    else:
        return render_template("signin.html")


@app.route("/login", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username == "" or password == "":
            msg = "Enter Username and Password!!!"
            return render_template('signin.html', msg=msg)
        else:
            result = db.db_login(username, password)
            if result == "no":
                msg = "Invalid Username or Password!!!"
                return render_template('signin.html', msg=msg)
            elif result == "not":
                msg = "You are not verified yet! Contact Admin department!!"
                return render_template('signin.html', msg=msg)
            elif result == "rejected":
                msg = "Your registration request has been rejected by Admin department!"
                return render_template('signin.html', msg=msg)
            elif result == "admin":
                session['username'] = username
                session['password'] = password
                userid = db.get_userid(username, password)
                db.add_history(userid, username, "Logged In")
                return redirect(url_for('adminhome'))
            elif result == "user":
                session['username'] = username
                session['password'] = password
                userid = db.get_userid(username, password)
                db.add_history(userid, username, "Logged In")
                return redirect(url_for('userhome'))
            else:
                return redirect(url_for('signin_nav'))
    else:
        return redirect(url_for('signin_nav'))


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db.user_register(username, password)
        userid = db.get_userid(username, password)
        db.add_history(userid, username, "Registered as new user")
        return redirect(url_for('signin_nav'))
    else:
        return redirect(url_for('home'))


@app.route('/logout')
def logout():
    if 'username' in session:
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'], "Logged out")
        session.pop('username', None)
        return redirect(url_for('signin_nav'))


@app.route('/newuser')
def newuser():
    if 'username' in session:
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'], "Checked for new requests")
        data = db.get_new_users()
        return render_template('newuser.html', data=data)
    else:
        return render_template('signin.html')


@app.route('/acceptuser', methods=['GET', 'POST'])
def acceptuser():
    val = 1
    if request.method == 'POST':
        username = request.form['username']
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'],
                       "Accepted new user " + username)
        db.update_user(username, val)
        return redirect(url_for('newuser'))
    else:
        return redirect(url_for('newuser'))


@app.route('/rejectuser', methods=['GET', 'POST'])
def rejectuser():
    val = 0
    if request.method == 'POST':
        username = request.form['username']
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'],
                       "Rejected new user " + username)
        db.update_user(username, val)
        return redirect(url_for('newuser'))
    else:
        return redirect(url_for('newuser'))


@app.route('/viewdataset')
def viewdataset():
    if 'username' in session:
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'], "Viewed Dataset")
        csvarray = []
        filename = 'employees.csv'
        with open(filename, 'r') as read:
            count = 0
            csv_reader = reader(read)
            for row in csv_reader:
                count += 1
                csvarray.append(row)
                if count > 100:
                    break
            return render_template('ViewDataset.html', DataOut=csvarray)
    else:
        return render_template('signin.html')


@app.route('/checksession')
def checksession():
    if session['username'] == 'admin':
        return redirect(url_for('adminhome'))
    else:
        return redirect(url_for('userhome'))


@app.route('/history')
def history():
    if 'username' in session:
        userid = db.get_userid(session['username'], session['password'])
        data = db.get_history(userid, session['username'])
        return render_template('history.html', data=data)
    else:
        return render_template('signin.html')


@app.route('/prediction_nav')
def prediction_nav():
    return render_template('prediction.html')


@app.route('/prediction', methods=["GET", "POST"])
def prediction():
    if 'username' in session:
        if request.method == "POST":
            if request.files['file'].filename != '':
                file = request.files['file']
                data = pd.read_csv(file)
                names = list(data['Employee_Name'])
                empid = list(data['Employee_Id'])
                allocatedDays = data['Allocated_Days']
                completedInDays = data['Completed_In_Days']
                isOnTime = data['isOnTime']
                appraisal = data['Appraisal_Cycles']
                years = data['Years_In_Company']
                complaints = data['Complaints_received']
                hours = data['average_monthly_hours']
                behavior = []
                model = pickle.load(open("model.pkl", "rb"))
                for i, j, k, l, m, n, p in zip(allocatedDays, completedInDays, isOnTime, appraisal, years, complaints, hours):
                    inputData = [[i, j, k, l, m, n, p]]
                    prediction = model.predict(inputData)
                    if prediction[0] == 5:
                        behavior.append("Excellent")
                    elif prediction[0] == 4:
                        behavior.append("Good")
                    elif prediction[0] == 3:
                        behavior.append("Average")
                    elif prediction[0] == 2:
                        behavior.append("Below Average")
                    elif prediction[0] == 1:
                        behavior.append("Bad")
                result = [empid, names, behavior]
                print(result)
                return render_template('result2.html', result=result)
            else:
                name = request.form['fullname']
                allocatedDays = request.form['allocatedDays']
                completedInDays = request.form['completedInDays']
                appraisal = request.form['appraisal']
                isOnTime = request.form['isOnTime']
                complaints = request.form['complaints']
                doj = request.form['doj']
                hours = request.form['hours']
                if name == "" or str(allocatedDays) == "" or str(completedInDays) == "" or str(appraisal) == "" or str(isOnTime) == "" or str(complaints) == "" or str(doj) == "":
                    errorMsg = "Please fill all values"
                    return render_template('prediction.html', errorMsg=errorMsg)
                else:
                    time_difference = relativedelta(
                        datetime.today(), datetime.strptime(doj, '%Y-%m-%d'))
                    years = int(time_difference.years)

                    inputData = [[allocatedDays, completedInDays,
                                  isOnTime, appraisal, years, complaints, hours]]
                    # model = pickle.load(open("model1.pkl", "rb"))
                    model = pickle.load(open("model.pkl", "rb"))
                    prediction = model.predict(inputData)
                    msg = ""
                    if prediction[0] == 5:
                        msg = "Excellent"
                    elif prediction[0] == 4:
                        msg = "Good"
                    elif prediction[0] == 3:
                        msg = "Average"
                    elif prediction[0] == 2:
                        msg = "Below Average"
                    elif prediction[0] == 1:
                        msg = "Bad"
                    ontime = ""
                    if int(isOnTime) == 1:
                        ontime = "Yes"
                    else:
                        ontime = "No"
                    data = [name, allocatedDays, completedInDays,
                            appraisal, ontime, complaints, doj, msg]
                    userid = db.get_userid(
                        session['username'], session['password'])
                    db.addPredictionHistory(str(userid), name, str(allocatedDays), str(completedInDays), str(
                        appraisal), ontime, str(complaints), str(doj), msg)

                    db.add_history(userid, session['username'],
                                   "Predicted Behavior for " + name)
                    return render_template('result.html', data=data)
        else:
            return render_template('prediction.html')
    else:
        return render_template('index.html')


@app.route('/prediction_history')
def prediction_history():
    if 'username' in session:
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'],
                       "Viewed Prediction History ")
        data = db.getPredictionHistory(userid)
        return render_template('predictionhistory.html', data=data)

    else:
        return render_template('index.html')


@app.route('/graph')
def graph():
    if 'username' in session:
        userid = db.get_userid(session['username'], session['password'])
        db.add_history(userid, session['username'],
                       "Viewed Graph")
        data = pd.read_csv("employees.csv")
        behaviors = list(data["Behavior"])
        counts = Counter(behaviors)
        values = [int(counts['Excellent']), int(counts['Good']),
                  int(counts['Average']), int(counts['Below Average']), int(counts['Bad'])]
        return render_template('graph.html', values=values)
    else:
        return render_template('index.html')


if __name__ == "__main__":
    app.run(debug=True)
