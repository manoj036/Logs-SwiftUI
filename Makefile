.PHONY: all setup gen_project

all: setup gen_project

setup:
		brew install mint
		mint install yonaskolb/xcodegen

gen_project:
		xcodegen generate

.DEFAULT_GOAL := gen_project
