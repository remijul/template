@echo off
setlocal enabledelayedexpansion

:: Check if project name is provided
if "%1"=="" (
    echo Please provide a project name
    echo Usage: setup.bat project_name
    exit /b 1
)

set PROJECT_NAME=%1

:: Create main project directory
mkdir %PROJECT_NAME%
cd %PROJECT_NAME%

:: Create .github directory structure
mkdir .github\workflows
mkdir .github\ISSUE_TEMPLATE
type nul > .github\workflows\main.yml
type nul > .github\ISSUE_TEMPLATE\bug_report.md
type nul > .github\ISSUE_TEMPLATE\feature_request.md
type nul > .github\PULL_REQUEST_TEMPLATE.md

:: Create app directory structure
mkdir app\streamlit\pages
mkdir app\streamlit\components
mkdir app\streamlit\utils
type nul > app\streamlit\__init__.py
type nul > app\streamlit\app.py
type nul > app\streamlit\pages\__init__.py
type nul > app\streamlit\pages\home.py
type nul > app\streamlit\pages\analysis.py
type nul > app\streamlit\components\__init__.py
type nul > app\streamlit\components\widgets.py
type nul > app\streamlit\utils\__init__.py
type nul > app\streamlit\utils\helpers.py

:: Create Django app structure
mkdir app\django_app\static\css
mkdir app\django_app\static\js
mkdir app\django_app\static\images
mkdir app\django_app\templates\pages
mkdir app\django_app\project_name
mkdir app\django_app\api
type nul > app\django_app\manage.py
type nul > app\django_app\requirements_django.txt
type nul > app\django_app\templates\base.html
type nul > app\django_app\project_name\__init__.py
type nul > app\django_app\project_name\settings.py
type nul > app\django_app\project_name\urls.py
type nul > app\django_app\project_name\asgi.py
type nul > app\django_app\project_name\wsgi.py
type nul > app\django_app\api\__init__.py
type nul > app\django_app\api\models.py
type nul > app\django_app\api\serializers.py
type nul > app\django_app\api\urls.py
type nul > app\django_app\api\views.py

:: Create data directory structure
mkdir data\raw
mkdir data\processed
mkdir data\external
type nul > data\raw\.gitkeep
type nul > data\processed\.gitkeep
type nul > data\external\.gitkeep

:: Create docs directory structure
mkdir docs\api
mkdir docs\user_guide
mkdir docs\development
type nul > docs\api\.gitkeep
type nul > docs\user_guide\.gitkeep
type nul > docs\development\.gitkeep

:: Create notebooks directory structure
mkdir notebooks\exploratory
mkdir notebooks\reports
type nul > notebooks\exploratory\.gitkeep
type nul > notebooks\reports\.gitkeep

:: Create src directory structure
mkdir src\data
mkdir src\features
mkdir src\models
mkdir src\visualization
mkdir src\utils
type nul > src\__init__.py
type nul > src\data\__init__.py
type nul > src\data\make_dataset.py
type nul > src\data\preprocess.py
type nul > src\features\__init__.py
type nul > src\features\build_features.py
type nul > src\models\__init__.py
type nul > src\models\train.py
type nul > src\models\predict.py
type nul > src\visualization\__init__.py
type nul > src\visualization\visualize.py
type nul > src\utils\__init__.py
type nul > src\utils\helpers.py

:: Create tests directory
mkdir tests
type nul > tests\__init__.py
type nul > tests\test_data.py
type nul > tests\test_models.py

:: Create root level files
type nul > .env.example
type nul > .gitignore
type nul > .pre-commit-config.yaml
type nul > LICENSE
type nul > Makefile
type nul > README.md
type nul > requirements.txt
type nul > setup.py
type nul > tox.ini

:: Create .gitignore content
(
echo # Python
echo __pycache__/
echo *.py[cod]
echo *$py.class
echo *.so
echo .Python
echo env/
echo build/
echo develop-eggs/
echo dist/
echo downloads/
echo eggs/
echo .eggs/
echo lib/
echo lib64/
echo parts/
echo sdist/
echo var/
echo wheels/
echo *.egg-info/
echo .installed.cfg
echo *.egg
echo.
echo # Jupyter Notebook
echo .ipynb_checkpoints
echo */.ipynb_checkpoints/*
echo.
echo # VSCode
echo .vscode/
echo *.code-workspace
echo.
echo # PyCharm
echo .idea/
echo.
echo # Environment
echo .env
echo .venv
echo venv/
echo ENV/
echo.
echo # Data
echo data/raw/*
echo data/processed/*
echo data/external/*
echo !data/raw/.gitkeep
echo !data/processed/.gitkeep
echo !data/external/.gitkeep
echo.
echo # Model files
echo *.h5
echo *.pkl
echo *.model
echo.
echo # Logs
echo logs/
echo *.log
echo.
echo # OS generated files
echo .DS_Store
echo .DS_Store?
echo ._*
echo .Spotlight-V100
echo .Trashes
echo ehthumbs.db
echo Thumbs.db
) > .gitignore

:: Create requirements.txt content
(
echo # Core dependencies
echo numpy^>=1.21.0
echo pandas^>=1.3.0
echo scikit-learn^>=1.0.0
echo matplotlib^>=3.4.0
echo seaborn^>=0.11.0
echo jupyter^>=1.0.0
echo.
echo # Development dependencies
echo pytest^>=6.2.5
echo black^>=21.5b2
echo flake8^>=3.9.0
echo isort^>=5.9.0
echo pre-commit^>=2.15.0
echo.
echo # Documentation
echo sphinx^>=4.0.0
echo sphinx-rtd-theme^>=0.5.0
echo.
echo # Web App Dependencies
echo streamlit^>=1.22.0
echo django^>=4.2.0
echo djangorestframework^>=3.14.0
echo django-cors-headers^>=3.14.0
echo whitenoise^>=6.4.0
echo gunicorn^>=20.1.0
) > requirements.txt

:: Create README.md content
(
echo # %PROJECT_NAME%
echo.
echo Brief description of what this project does and who it's for.
echo.
echo ## Features
echo.
echo - Feature 1
echo - Feature 2
echo - Feature 3
echo.
echo ## Prerequisites
echo.
echo List what they need to use the software:
echo.
echo ```bash
echo - Python 3.8+
echo - pip
echo - Other dependencies...
echo ```
echo.
echo ## Installation
echo.
echo ```bash
echo # Clone the repository
echo git clone https://github.com/username/%PROJECT_NAME%.git
echo.
echo # Navigate to the project directory
echo cd %PROJECT_NAME%
echo.
echo # Create a virtual environment
echo python -m venv venv
echo.
echo # Activate the virtual environment
echo # On Windows:
echo venv\Scripts\activate
echo # On Unix or MacOS:
echo source venv/bin/activate
echo.
echo # Install dependencies
echo pip install -r requirements.txt
echo ```
echo.
echo ## Usage
echo.
echo Describe how to use your project.
echo.
echo ## Contributing
echo.
echo Contributions are welcome!
echo.
echo ## License
echo.
echo This project is licensed under the MIT License - see the LICENSE file for details.
) > README.md

:: Create basic Streamlit app.py content
(
echo import streamlit as st
echo.
echo def main^(^):
echo     st.set_page_config^(
echo         page_title="Your App Name",
echo         page_icon="🚀",
echo         layout="wide"
echo     ^)
echo     
echo     st.title^("Welcome to Your App"^)
echo     
echo     # Add your Streamlit app content here
echo     st.write^("This is a template for your Streamlit application."^)
echo     
echo if __name__ == "__main__":
echo     main^(^)
) > app\streamlit\app.py

echo Project structure created successfully!
echo Next steps:
echo 1. cd %PROJECT_NAME%
echo 2. Initialize git repository: git init
echo 3. Create virtual environment: python -m venv venv
echo 4. Activate virtual environment and install requirements