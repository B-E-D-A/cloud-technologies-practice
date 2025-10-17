from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from Flask + Nginx!"

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0")
