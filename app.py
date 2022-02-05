
from flask import Flask, render_template, request
from werkzeug import secure_filename
from run_model import chatBot
from training import train_model

app = Flask(__name__)

@app.route("/")
def home_view():
    return "<h1>Welcome</h1>"

@app.route("/help")
def help_view():
    message = request.json
    return chatBot(message)

@app.route('/uploader', methods=['GET', 'POST'])
def upload_file():
   if request.method == 'POST':
      f = request.files['file']
      f.save(secure_filename(f.filename))
      return 'file uploaded successfully'

@app.route('/train')
def train():
    if request.method == 'POST':
        f = request.files['file']
        f.save(secure_filename(f.filename))
        return 'file uploaded successfully'

if __name__ == "__main__":
    app.run()
