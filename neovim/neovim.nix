{pkgs, config, nixvim, ...}:
{
	imports = [
		nixvim.homeManagerModules.nixvim 
	];
	programs.neovim = {
		defaultEditor = true;
		vimAlias = true;
	};
        programs.nixvim = {
		enable = true;
		options = {
			number = true;
			relativenumber = true;
		};
		colorschemes.rose-pine.enable = true;
		extraConfigLua = ''
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			'';
		plugins = {
			treesitter.enable = true;
			treesitter.ensureInstalled = "all";
			nix.enable = true;
			neo-tree.enable = true;
			lsp = {
				enable = true;
				servers = {
					rust-analyzer.enable = true;
					nixd.enable = true;
					html.enable = true;
					jsonls.enable = true;
					lua-ls.enable = true;
					cssls.enable = true;
					cmake.enable = true;
					bashls.enable = true; 
				};
			};

		};

	};
}
