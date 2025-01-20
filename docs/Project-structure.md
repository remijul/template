

# Project structure

```md
project-name/
├── .github/                      # GitHub specific files
│   ├── workflows/                # GitHub Actions workflows
│   │   └── main.yml             # Main CI/CD pipeline
│   ├── ISSUE_TEMPLATE/          # Issue templates
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md
├── app/                         # Web application directory
│   ├── streamlit/              # Streamlit app (if using Streamlit)
│   │   ├── __init__.py
│   │   ├── app.py             # Main Streamlit application
│   │   ├── pages/             # Streamlit pages
│   │   │   ├── __init__.py
│   │   │   ├── home.py
│   │   │   └── analysis.py
│   │   ├── components/        # Reusable Streamlit components
│   │   │   ├── __init__.py
│   │   │   └── widgets.py
│   │   └── utils/            # Streamlit-specific utilities
│   │       ├── __init__.py
│   │       └── helpers.py
│   └── django_app/           # Django app (if using Django)
│       ├── manage.py
│       ├── requirements_django.txt
│       ├── static/           # Static files (CSS, JS, images)
│       │   ├── css/
│       │   ├── js/
│       │   └── images/
│       ├── templates/        # HTML templates
│       │   ├── base.html
│       │   └── pages/
│       ├── project_name/     # Django project settings
│       │   ├── __init__.py
│       │   ├── settings.py
│       │   ├── urls.py
│       │   ├── asgi.py
│       │   └── wsgi.py
│       └── api/             # Django REST API app
│           ├── __init__.py
│           ├── models.py
│           ├── serializers.py
│           ├── urls.py
│           └── views.py
├── data/                        # Data directory
│   ├── raw/                     # Raw, immutable data
│   ├── processed/               # Cleaned and processed data
│   └── external/                # External source data
├── docs/                        # Documentation
│   ├── api/                     # API documentation
│   ├── user_guide/             # User guide and tutorials
│   └── development/            # Development guidelines
├── notebooks/                   # Jupyter notebooks
│   ├── exploratory/            # EDA notebooks
│   └── reports/                # Final analysis notebooks
├── src/                        # Source code
│   ├── __init__.py
│   ├── data/                   # Data processing scripts
│   │   ├── __init__.py
│   │   ├── make_dataset.py
│   │   └── preprocess.py
│   ├── features/               # Feature engineering
│   │   ├── __init__.py
│   │   └── build_features.py
│   ├── models/                 # Model training and prediction
│   │   ├── __init__.py
│   │   ├── train.py
│   │   └── predict.py
│   ├── visualization/          # Visualization scripts
│   │   ├── __init__.py
│   │   └── visualize.py
│   └── utils/                  # Utility functions
│       ├── __init__.py
│       └── helpers.py
├── tests/                      # Test files
│   ├── __init__.py
│   ├── test_data.py
│   └── test_models.py
├── .env.example                # Example environment variables
├── .gitignore                  # Git ignore rules
├── .pre-commit-config.yaml     # Pre-commit hooks configuration
├── LICENSE                     # License file
├── Makefile                    # Makefile for common commands
├── README.md                   # Project documentation
├── requirements.txt            # Project dependencies
├── setup.py                    # Package setup file
└── tox.ini                     # Tox configuration for testing
```
