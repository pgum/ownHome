.PHONY: all env tools config tags clean

all: env tools config

env:
	scripts/deployEnv
tools:
	scripts/installTools
config:
	scripts/configureEnv

#maintenance
clean:
	scripts/nukeEnv
#development
tags:
	ctags -R --language-force=sh -f ./scripts/tags ./scripts/
