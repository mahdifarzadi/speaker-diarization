Path=$(shell pwd)
Python=python3
Celery=celery
Make=make
Pip=pip

runserver:
	cd api && \
	$(Python) manage.py runserver

runcelery:
	cd api && \
	$(Celery) -A api worker -l INFO

runtelbot:
	$(Python) ./bots/telegram/main.py

rungradio:
	$(Python) ./client/gradio/main.py

run:
	$(Make) -j 4 runcelery runserver rungradio runtelbot

deps:
	$(Pip) freeze > requirements.txt

install:
	$(Pip) install