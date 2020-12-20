# Start from the official Python 3.9 container
FROM python:3.9.1

# Expose the default Quart port
EXPOSE 8000


ENV PORT 8000

# Set the main working directory
WORKDIR /home/api

# Install the require Python packages
COPY requirements.txt ./
RUN pip install -U pip
RUN pip install -Ur requirements.txt --no-cache-dir --compile

# Copy the application code
COPY ./avwx_api ./avwx_api
COPY hypercorn_config.py .


# Run the application
CMD ["hypercorn", "avwx_api:app", "-c", "file:hypercorn_config.py"]