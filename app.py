from flask import Flask
from prometheus_client import Counter, generate_latest

app = Flask(__name__)
login_metric = Counter('login', 'User login', ['username'])
signup_metric = Counter('signup', 'User signup', ['username'])

@app.get('/login/<username>')
def login(username: str):
    login_metric.labels(username=username).inc()
    return f"{username} logged in"

@app.get('/signup/<username>')
def signup(username: str):
    signup_metric.labels(username=username).inc()
    return f"{username} signed up"

@app.get('/metrics')
def metrics():
    return generate_latest()

