# Use official Python image as base
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install system dependencies (if needed for any Python packages)
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Environment variables (set these when running the container)
ENV AZURE_OPENAI_ENDPOINT="https://aemfoundry1507.cognitiveservices.azure.com/"
ENV AZURE_OPENAI_KEY="8381LxyI3QToYrKco757N6uZrQ1kVPACTWOtqvILRh5VDky8Kt6bJQQJ99BGACYeBjFXJ3w3AAAAACOGEyYn"

# Make the script executable (if needed)
RUN chmod +x app.py

# Command to run the chatbot in console mode
ENTRYPOINT ["python", "app.py"]



