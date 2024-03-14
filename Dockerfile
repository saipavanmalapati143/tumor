# Use an official Python runtime as a parent image
FROM ubuntu
RUN apt update
RUN apt install python3-pip -y


# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV UPLOAD_FOLDER /app/uploads
ENV STATIC_FOLDER /app/static

# Run app.py when the container launches
CMD ["python", "app.py", "0.0.0.0:5000"]
