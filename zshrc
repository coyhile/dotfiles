PROMPT='%m:%~ %# '
bindkey -e

if [ -d /usr/pkg/bin ]; then
	PATH=/usr/pkg/bin:$PATH
	MANPATH=/usr/pkg/man:$MANPATH
fi

if [ -d /usr/pkg/sbin ]; then
	PATH=/usr/pkg/sbin:$PATH
fi

export PATH MANPATH
