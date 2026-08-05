# pyright: reportMissingImports=false
try:
    from flask import Flask, jsonify
except ImportError:
    class Flask:
        def __init__(self, name):
            self.name = name
            self.routes = {}

        def route(self, path):
            def decorator(func):
                self.routes[path] = func
                return func
            return decorator

        def run(self, host="0.0.0.0", port=8000):
            print(f"Fallback Flask server running on {host}:{port}")

    def jsonify(payload):
        import json
        return json.dumps(payload)

import os

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify({
        "application": "Ecommerce Modernization",
        "status": "running",
        "platform": "Azure App Service",
        "runtime": "Python 3.12",
        "environment": os.getenv("ENVIRONMENT", "dev")
    })


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })


if __name__ == "__main__":
    port = int(os.getenv("PORT", 8000))
    app.run(host="0.0.0.0", port=port)