FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port that the app will run on
EXPOSE 5000

# Start the Prometheus server and Flask app
# CMD python -m prometheus_client start_http_server 8000 --web-telemetry-path=/metrics & python app.py
CMD flask run -h 0.0.0.0
