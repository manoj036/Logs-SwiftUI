.PHONY: all setup gen_project

all: setup gen_project

setup:
		mint install yonaskolb/xcodegen

gen_project:
		xcodegen generate

.DEFAULT_GOAL := gen_project
