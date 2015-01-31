echo "$0 WGRANY!"
alias ll='ls -Al --color=always'
alias ls='ls -A --color=always'
alias ..='cd ..'
alias mv='mv -v -i'
alias cp='cp -v -i'
alias rm='rm -v -i'
alias rmrf='rm -r -v -f'
shopt -s autocd
hdd='/i-data/md0'
alias basr='. ~/.bashrc'
export PS1="\[\e[1;32m\]\h\[\e[1;32m\]\[\e[1;34m\]\W \[\e[0m\]\\$ "
# Make sure that there is no logging of the session.
# Privacy issues and it was mentioned that logging makes slow the logout.
unset HISTFILE
export PATH=./:$PATH
export GREP_OPTIONS='--color=auto'
alias svig="svn propedit svn:ignore"
