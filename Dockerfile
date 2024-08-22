# Use a Python image as the base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file from the book_catalog folder to the container
COPY book_catalog/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY book_catalog/ .

# Expose the desired port
EXPOSE 8000

# Define environment variable
ENV DATABASE_URL=postgresql://project2_a46s_user:XKgAx43igFex8PrzoZqGYKVyRu0yb1kI@dpg-cr3eo0t6l47c73a365v0-a.oregon-postgres.render.com:5432/project2_a46s

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
