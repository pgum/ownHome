.PHONY: all env tools config tags

all: env tools config

env:
	scripts/deployEnv
tools:
	scripts/installTools
config:
	scripts/configureEnv

#development
tags:
	ctags -R --language-force=sh -f ./scripts/tags ./scripts/
