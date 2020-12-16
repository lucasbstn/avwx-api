# Start from the official Python 3.8 container
FROM python:3.8.6

# Expose the default Quart port
EXPOSE 8000

# Set the main working directory
WORKDIR /home/api

# Set the service credentials as environment variables
#ENV MONGO_URI='mongodb+srv://cache:password==@loc.test.com:12345'
#ENV LOG_KEY='rollbar-server-key'


# Install the require Python packages
COPY requirements.txt /home/api/requirements.txt
RUN pip install -U pip
RUN pip install -Ur requirements.txt --no-cache-dir --compile

# Copy the application code
COPY avwx_api /home/api/avwx_api
COPY hypercorn_config.py /home/api/hypercorn_config.py

# Run the application
CMD ["hypercorn", "avwx_api:app", "-c", "file:hypercorn_config.py"]
