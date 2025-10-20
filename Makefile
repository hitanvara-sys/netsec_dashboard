# Virtual environment settings
VENV=env
PYTHON=$(VENV)/Scripts/python.exe
PIP=$(VENV)/Scripts/pip.exe

# Default target
help:
	@echo "Common commands:"
	@echo "  make install      - install dependencies from requirements.txt"
	@echo "  make run          - start Django dev server"
	@echo "  make migrate      - apply migrations"
	@echo "  make superuser    - create Django admin user"
	@echo "  make fmt          - run Black + isort formatting"
	@echo "  make lint         - run flake8 linting"
	@echo "  make freeze       - update requirements.txt"
	@echo "  make test         - run Django tests"

install:
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

run:
	$(PYTHON) manage.py runserver

migrate:
	$(PYTHON) manage.py makemigrations
	$(PYTHON) manage.py migrate

superuser:
	$(PYTHON) manage.py createsuperuser

fmt:
	$(VENV)/Scripts/isort .
	$(VENV)/Scripts/black .

lint:
	$(VENV)/Scripts/flake8 .

freeze:
	$(PIP) freeze > requirements.txt

test:
	$(PYTHON) manage.py test
