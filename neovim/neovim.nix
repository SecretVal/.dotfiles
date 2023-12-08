{pkgs, config,  ...}:
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
	};
    xdg.configFile."nvim".source = ./config;
}
