if [ -x /opt/pkg/bin/zsh ] ; then
   SHELL=/opt/pkg/bin/zsh
elif [ -x /opt/local/bin/zsh ] ; then
	 SHELL=/opt/local/bin/zsh
elif [ -x /bin/zsh ] ; then
	 SHELL=/bin/zsh
fi

[ $SHELL != "/bin/bash" ] && exec $SHELL
