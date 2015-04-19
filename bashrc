echo "$0 WGRANY!"

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#<C-s> putty freezer fix
[[ $- == *i* ]] && stty -ixany
[[ $- == *i* ]] && stty ixoff -ixon


fgp()
{
    find . -name *$1* -exec grep -l "$2" {} \;
}


##PUTTY
alias clr="clear && printf '\033[3J'"

alias tarit='tar -cvf '
alias untarit='tar -xf '

alias h='history | grep $1'
alias top-commands='history | awk "{print $2}" | awk "BEGIN {FS="|"} {print $1}" |sort|uniq -c | sort -rn | head -10'

alias ls='ls -A --color=always'
alias ll='ls -l'

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
alias dea="deactivate"
source ~/.autoenv/activate.sh
