
tags:
	ctags -R --language-force=sh -f ./scripts/tags ./scripts/

env:
	scripts/deployEnv

tools:
	scripts/installTools

all: env tools

clean:
	scripts/nukeEnv


