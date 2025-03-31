from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello Mehul, welcome to DevOps Zero To Hero (Junoon  Batch 9) Lets Rock People'
    return 'Helloooo Doston Ye Line mene update ki hai check karne ke liye'

@app.route('/health')
def health():
    return 'Server is up and running'
