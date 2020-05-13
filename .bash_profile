# To ensure that same setting is applied to both login and non-login shell, now custmization done in bashrc file will be applicable to both login and non-login shell
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
