### Makefile
```makefile
.PHONY: clean data lint requirements sync_data_to_s3 sync_data_from_s3

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PYTHON_INTERPRETER = python3

#################################################################################
# COMMANDS                                                                        #
#################################################################################

## Install Python Dependencies
requirements:
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt

## Make Dataset
data: requirements
	$(PYTHON_INTERPRETER) src/data/make_dataset.py

## Delete all compiled Python files
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

## Lint using flake8
lint:
	flake8 src

## Upload Data to S3
sync_data_to_s3:
	aws s3 sync data/ s3://$(BUCKET)/data/

## Download Data from S3
sync_data_from_s3:
	aws s3 sync s3://$(BUCKET)/data/ data/

## Set up python interpreter environment
create_environment:
	$(PYTHON_INTERPRETER) -m venv venv
	@echo ">>> New virtualenv created. Activate with:\nsource venv/bin/activate"

## Test python environment is setup correctly
test_environment:
	$(PYTHON_INTERPRETER) test_environment.py

#################################################################################
# PROJECT RULES                                                                   #
#################################################################################

## Run tests
test:
	pytest

## Format code
format:
	black src
	isort src

#################################################################################
# Self Documenting Commands                                                       #
#################################################################################

.DEFAULT_GOAL := help

help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}'

#################################################################################
# WEB APP COMMANDS                                                                #
#################################################################################

## Run Streamlit app
streamlit:
	streamlit run app/streamlit/app.py

## Run Django development server
django-run:
	python app/django_app/manage.py runserver

## Make Django migrations
django-migrations:
	python app/django_app/manage.py makemigrations
	python app/django_app/manage.py migrate

## Create Django superuser
django-superuser:
	python app/django_app/manage.py createsuperuser

## Collect Django static files
django-static:
	python app/django_app/manage.py collectstatic --noinput

## Install Django-specific requirements
django-requirements:
	$(PYTHON_INTERPRETER) -m pip install -r app/django_app/requirements_django.txt