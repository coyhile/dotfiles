PROMPT='%m:%~ %# '
bindkey -e

PATH=/usr/bin:/usr/sbin:/sbin/:/bin
if [ -d /usr/pkg/bin ]; then
	PATH=/usr/pkg/bin:$PATH
	MANPATH=/usr/pkg/man:$MANPATH
fi

if [ -d /usr/pkg/sbin ]; then
	PATH=/usr/pkg/sbin:$PATH
fi

if [ -d /opt/local/bin ]; then
	PATH=/opt/local/bin:$PATH
	MANPATH=/opt/local/man:$MANPATH
fi

if [ -d /opt/local/sbin ]; then
	PATH=/opt/local/sbin:$PATH
fi

export PATH MANPATH

# Ingenious way to set $EDITOR
__() {
	local -a editors
	local editor
	editors=(
		"emacs -nw"
		"vim" "vi" 
		)
	for editor in $editors; do
		(( $+commands[$editor[(w)1]] )) && {
			export EDITOR=$editor
			break
		}
	done
} && __
