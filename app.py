from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    content = None
    if request.method == 'POST':
        url = request.form['url']
        try:
            # Extract the raw URL from GitHub
            raw_url = url.replace('github.com', 'raw.githubusercontent.com').replace('/blob/', '/')
            response = requests.get(raw_url)
            response.raise_for_status()  # Raise an error for bad responses
            content = response.text
        except Exception as e:
            content = f"Error fetching the file: {str(e)}"
    return render_template('index.html', content=content)

if __name__ == '__main__':
    app.run(debug=True)
