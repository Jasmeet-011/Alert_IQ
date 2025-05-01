# Use a more secure Python base image
FROM python:3.12-slim

# Set environment variables
ENV FLASK_APP=app:create_app
ENV FLASK_ENV=development
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Run the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
