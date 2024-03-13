# Use the official Python image as a base image
FROM python:3.9-slim

# Set environment variables for Flask
ENV FLASK_APP=app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=8080 \
    UPLOAD_FOLDER=uploads \
    STATIC_FOLDER=static

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install necessary packages
RUN apt-get update && apt-get install -y libgl1-mesa-glx && \
    pip install --no-cache-dir -r requirements.txt

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the application
CMD ["flask", "run"]
