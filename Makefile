test:
	PYTHONPATH=. pytest --cov=src tests/

setup:
	python3 -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt

clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -r {} +
	rm -rf .pytest_cache .coverage htmlcov

cov:
	PYTHONPATH=. pytest --cov=src --cov-report=html tests/
	@echo "Le rapport HTML est disponible dans htmlcov/index.html"

open-cov:
ifeq ($(shell uname), Linux)
	powershell.exe /c start htmlcov/index.html
else ifeq ($(shell uname), Darwin)
	powershell.exe /c start htmlcov/index.html
else
	powershell.exe /c start htmlcov/index.html
endif
