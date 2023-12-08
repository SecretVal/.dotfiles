{pkgs, config,  ...}:
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		plugins = with pkgs.vimPlugins;[
			telescope-nvim
				dracula-nvim
				null-ls-nvim
				nvim-lspconfig
				cmp-nvim-lsp
				nvim-cmp
				luasnip
		];
		extraLuaConfig = ''
			${builtins.readFile ./config/set.lua}
		'';
	};

}
