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

# MANTA setup
MANTA_URL=https://us-east.manta.joyent.com
MANTA_USER=cah220
unset MANTA_SUBUSER # Unless you have subusers
MANTA_KEY_ID=$(ssh-keygen -l -f $HOME/.ssh/id_rsa.pub | awk '{print $2}')
# change this to use a different DC
SDC_URL=https://us-east-1.api.joyent.com
SDC_ACCOUNT=cah220
SDC_KEY_ID=$(ssh-keygen -l -f $HOME/.ssh/id_rsa.pub | awk '{print $2}')
export MANTA_URL MANTA_USER MANTA_KEY_ID SDC_ACCOUNT SDC_URL SDC_KEY_ID
