#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Make database migrations
python manage.py makemigrations

# Apply database migrations
python manage.py migrate

# Create a superuser with predefined credentials
echo "from django.contrib.auth import get_user_model; User = get_user_model(); \
User.objects.filter(username='admin2@gmail.com').exists() or \
User.objects.create_superuser('admin2@gmail.com', 'admin2@gmail.com', 'admin')" | python manage.py shell
