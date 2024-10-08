# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy your Python script into the container
COPY . .

# Run the script every 2 seconds
CMD while true; do python /app/start.py; sleep 2; done
