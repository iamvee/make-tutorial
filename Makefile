SHELL = bash
MY_DIRS = foo bar baz 

.DEFAULT_GOAL := help
.PHONY : all setup remove add $(MY_DIRS)

PY = python

help:   ## shows this message 
	@cat $(MAKEFILE_LIST) | egrep "^[a-zA-Z0-9_]+:.*"  | awk 'BEGIN { FS = ":.*?##"}; { printf "\033[31m %-20s \033[0m %s\n", $$1, $$2 }'

$(MY_DIRS):   
	@mkdir -p $@
	@touch ./$@/file.txt



setup: setup.py   ## setup python file 
	@${PY} setup.py


remove:   ## removes dummy files 
	@echo remove
	@rm ./dist/files/file-*.txt
	@rm -r ./dist

add:  ## add  files 
	@echo add
	@mkdir -p ./dist/files/
	@touch ./dist/files/file-{1..10}.txt


all: add remove   ## all whatever blaah blaah

