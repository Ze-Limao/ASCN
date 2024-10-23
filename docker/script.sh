#!/bin/bash

echo ">>> Running migration"
venv/bin/python manage.py migrate

if [ "$SEED" == "true" ]; then
  echo ">>> Running seed"
  venv/bin/python seed.py
fi

echo ">>> Starting app..."
venv/bin/python manage.py runserver 0.0.0.0:8000