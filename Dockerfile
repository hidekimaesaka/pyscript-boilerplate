# Use a lightweight Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy your Python script into the container
COPY . .

# Set a default interval (5 minutes) if RUN_INTERVAL is not set
ENV RUN_INTERVAL=10


# Run the script every 2 seconds
CMD while true; do python /app/start.py; sleep $RUN_INTERVAL; done
