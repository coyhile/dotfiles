autoload -U compinit
PROMPT='%m:%~ %# '
bindkey -e

# History stuff
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
export HISTSIZE SAVEHIST HISTFILE

PATH=/usr/bin:/usr/sbin:/sbin/:/bin
if [ -d /opt/pkg/bin ]; then
	PATH=/opt/pkg/bin:$PATH
	MANPATH=/opt/pkg/man:$MANPATH
fi

if [ -d /opt/pkg/sbin ]; then
	PATH=/opt/pkg/sbin:$PATH
fi

if [ -d /opt/local/bin ]; then
	PATH=/opt/local/bin:$PATH
	MANPATH=/opt/local/man:$MANPATH
fi

if [ -d /opt/local/sbin ]; then
	PATH=/opt/local/sbin:$PATH
fi

if [ -d /opt/chefdk/bin ]; then
	PATH=/opt/chefdk/bin:$PATH
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
MANTA_URL=https://manta.us-east.coyhile.com
MANTA_USER=hile
unset MANTA_SUBUSER # Unless you have subusers
MANTA_KEY_ID=$(ssh-keygen -l -f $HOME/.ssh/id_rsa.pub | awk '{print $2}')
# change this to use a different DC
# These SDC* environment variables are no longer needed with the triton tools.
#SDC_URL=https://us-east-1.api.joyent.com
#SDC_ACCOUNT=cah220
#SDC_KEY_ID=$(ssh-keygen -l -f $HOME/.ssh/id_rsa.pub | awk '{print $2}')
#export MANTA_URL MANTA_USER MANTA_KEY_ID SDC_ACCOUNT SDC_URL SDC_KEY_ID
export MANTA_URL MANTA_USER MANTA_KEY_ID
compinit
eval "$(chef shell-init zsh)"
