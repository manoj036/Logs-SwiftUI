.PHONY: all setup gen_project

all: setup gen_project

setup:
		mint install yonaskolb/xcodegen

gen_project:
		echo "hello"
		xcodegen generate

.DEFAULT_GOAL := gen_project
