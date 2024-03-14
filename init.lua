vim.cmd([[
  












































]])
require("catppuccin").setup({
	["custom_highlights"] = function(colors)
		return {
			Pmenu = { bg = colors.surface0, fg = colors.text },
			NormalFloat = { blend = 17 },
			TreesitterContext = { bg = colors.none, fg = colors.text },
		}
	end,
	["flavour"] = "mocha",
	["integrations"] = {
		["cmp"] = true,
		["fidget"] = true,
		["harpoon"] = true,
		["lsp_trouble"] = true,
		["mini"] = { ["enabled"] = true },
		["rainbow_delimiters"] = true,
		["telescope"] = { ["enabled"] = true },
		["treesitter"] = true,
	},
	["transparent_background"] = false,
})

-- Set up globals {{{
do
	local nixvim_globals = {
		["langmap"] = "äöü",
		["mapleader"] = " ",
		["maplocalleader"] = " ",
		["netrw_banner"] = 0,
		["netrw_browser_split"] = 0,
		["netrw_winsize"] = 25,
	}

	for k, v in pairs(nixvim_globals) do
		vim.g[k] = v
	end
end
-- }}}

-- Set up options {{{
do
	local nixvim_options = {
		["backup"] = false,
		["belloff"] = "all",
		["breakindent"] = true,
		["clipboard"] = "unnamedplus",
		["colorcolumn"] = "80",
		["completeopt"] = { "menu", "menuone", "noselect" },
		["conceallevel"] = 2,
		["cursorline"] = true,
		["expandtab"] = true,
		["foldlevel"] = 999,
		["hlsearch"] = false,
		["inccommand"] = "split",
		["incsearch"] = true,
		["laststatus"] = 3,
		["lcs"] = "eol:↲,tab:  ,trail:·",
		["list"] = true,
		["number"] = true,
		["pb"] = 17,
		["relativenumber"] = true,
		["scrolloff"] = 15,
		["shiftwidth"] = 4,
		["signcolumn"] = "yes",
		["smartindent"] = true,
		["softtabstop"] = 4,
		["splitbelow"] = true,
		["splitright"] = true,
		["swapfile"] = false,
		["tabstop"] = 4,
		["termguicolors"] = true,
		["undofile"] = true,
		["updatetime"] = 50,
		["virtualedit"] = "block",
		["wrap"] = false,
	}

	for k, v in pairs(nixvim_options) do
		vim.opt[k] = v
	end
end
-- }}}

vim.loader.enable()

vim.cmd([[
  let $BAT_THEME = 'catppuccin'

colorscheme catppuccin

]])
require("crates").setup({})

require("todo-comments").setup({})

require("oil").setup({
	["prompt_save_on_select_new_entry"] = false,
	["skip_confirm_for_simple_edits"] = true,
	["view_options"] = { ["show_hidden"] = true },
})

vim.notify = require("notify")
require("notify").setup({})

require("neorg").setup({
	["load"] = {
		["core.completion"] = { ["config"] = { ["engine"] = "nvim-cmp" } },
		["core.concealer"] = {},
		["core.defaults"] = {},
		["core.highlights"] = {},
		["core.integrations.nvim-cmp"] = {},
		["core.integrations.treesitter"] = {},
		["core.mode"] = {},
		["core.summary"] = {},
	},
})

require("indent-o-matic").setup({})

require("harpoon").setup({})

require("Comment").setup({})
require("image").setup({ ["backend"] = "ueberzug" })

do
	local __telescopeExtensions = { "ui-select" }

	require("telescope").setup({
		["extensions"] = { ["ui-select"] = { ["specific_opts"] = { ["codeactions"] = true } } },
	})

	for i, extension in ipairs(__telescopeExtensions) do
		require("telescope").load_extension(extension)
	end
end

require("lualine").setup({
	["options"] = {
		["component_separators"] = { ["left"] = "", ["right"] = "" },
		["globalstatus"] = true,
		["icons_enabled"] = true,
		["section_separators"] = { ["left"] = "", ["right"] = "" },
	},
})
require("luasnip").config.set_config({})

require("luasnip.loaders.from_vscode").lazy_load({})

require("trouble").setup({})

require("fidget").setup({ ["notification"] = { ["window"] = { ["relative"] = "editor", ["winblend"] = 0 } } })

require("conform").setup({
	["format_on_save"] = { ["lsp_fallback"] = true, ["timeout_ms"] = 500 },
	["formatters_by_ft"] = {
		["go"] = { "gofumpt" },
		["js"] = { "prettierd" },
		["json"] = { "jsonfmt" },
		["lua"] = { "stylua" },
		["nix"] = { "alejandra" },
		["rust"] = { "rustfmt" },
		["ts"] = { "prettierd" },
	},
})

-- LSP {{{
do
	local __lspServers = {
		{ ["name"] = "zls" },
		{ ["name"] = "tsserver" },
		{ ["name"] = "rust_analyzer" },
		{ ["name"] = "nil_ls" },
		{
			["extraOptions"] = {
				["settings"] = {
					["Lua"] = {
						["diagnostics"] = { ["globals"] = { "vim" } },
						["runtime"] = { ["version"] = "LuaJIT" },
						["telemetry"] = { ["enable"] = false },
						["workspace"] = {
							["checkThirdParty"] = false,
							["library"] = { vim.api.nvim_get_runtime_file("", true) },
						},
					},
				},
			},
			["name"] = "lua_ls",
		},
		{
			["extraOptions"] = {
				["cmd"] = {
					"/nix/store/rv05dg60bnp9pn5g0lmqqrwrl8lji113-vscode-langservers-extracted-4.8.0/bin/vscode-json-language-server",
					"--stdio",
				},
			},
			["name"] = "jsonls",
		},
		{
			["extraOptions"] = {
				["cmd"] = {
					"/nix/store/rv05dg60bnp9pn5g0lmqqrwrl8lji113-vscode-langservers-extracted-4.8.0/bin/vscode-html-language-server",
					"--stdio",
				},
			},
			["name"] = "html",
		},
		{ ["name"] = "gopls" },
		{
			["extraOptions"] = {
				["cmd"] = {
					"/nix/store/rv05dg60bnp9pn5g0lmqqrwrl8lji113-vscode-langservers-extracted-4.8.0/bin/vscode-css-language-server",
					"--stdio",
				},
			},
			["name"] = "cssls",
		},
		{ ["name"] = "cmake" },
		{ ["name"] = "clangd" },
		{ ["name"] = "bashls" },
	}
	local __lspOnAttach = function(client, bufnr) end
	local __lspCapabilities = function()
		capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		vim.keymap.set("n", "<leader>dl", "<cmd>TroubleToggle<cr>", { silent = true })

		return capabilities
	end

	local __setup = {
		on_attach = __lspOnAttach,
		capabilities = __lspCapabilities(),
	}

	for i, server in ipairs(__lspServers) do
		if type(server) == "string" then
			require("lspconfig")[server].setup(__setup)
		else
			local options = server.extraOptions

			if options == nil then
				options = __setup
			else
				options = vim.tbl_extend("keep", options, __setup)
			end

			require("lspconfig")[server.name].setup(options)
		end
	end
end
-- }}}

require("nvim-treesitter.configs").setup({
	["highlight"] = { ["enable"] = true },
	["indent"] = { ["enable"] = true },
	["textobjects"] = {
		["select"] = {
			["enable"] = true,
			["keymaps"] = {
				["ab"] = "@block.outer",
				["af"] = "@function.outer",
				["aif"] = "@conditional.outer",
				["al"] = "@loop.outer",
				["as"] = "@scopename.inner",
				["at"] = "@comment.outer",
				["ib"] = "@block.inner",
				["if"] = "@function.inner",
				["iif"] = "@conditional.inner",
				["il"] = "@loop.inner",
				["it"] = "@comment.inner",
				["s"] = "@statement.outer",
			},
		},
	},
})

require("treesitter-context").setup({})

__lint = require("lint")
__lint.linters_by_ft = {
	["go"] = { "golangcilint" },
	["json"] = { "jsonlint" },
	["markdown"] = { "vale" },
	["nix"] = { "nix" },
	["text"] = { "vale" },
}

require("gitsigns").setup({})

require("git-worktree").setup({ ["change_directory_command"] = "tcd", ["enabled"] = true })
require("telescope").load_extension("git_worktree")

local cmp = require("cmp")
cmp.setup({
	["experimental"] = { ["ghost_text"] = true, ["native_menu"] = false },
	["formatting"] = {
		["format"] = require("lspkind").cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				neorg = "[neorg]",
				emoji = "[emoji]",
				crates = "[crates]",
			},
		}),
	},
	["mapping"] = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	},
	["snippet"] = {
		["expand"] = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	["sources"] = {
		{ ["name"] = "nvim_lsp" },
		{ ["name"] = "luasnip" },
		{ ["name"] = "path" },
		{ ["name"] = "buffer" },
		{ ["name"] = "neorg" },
		{ ["name"] = "crates" },
		{ ["name"] = "emoji" },
	},
})

-- Set up keybinds {{{
do
	local __nixvim_binds = {
		{
			["action"] = require("harpoon.mark").add_file,
			["key"] = "<leader>a",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = require("harpoon.ui").toggle_quick_menu,
			["key"] = "<C-e>",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = function()
				require("harpoon.ui").nav_file(1)
			end,
			["key"] = "<C-j>",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = function()
				require("harpoon.ui").nav_file(2)
			end,
			["key"] = "<C-k>",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = function()
				require("harpoon.ui").nav_file(3)
			end,
			["key"] = "<C-l>",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = function()
				require("harpoon.ui").nav_file(4)
			end,
			["key"] = "<C-ö>",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = require("telescope.builtin").git_files,
			["key"] = "<C-p>",
			["mode"] = "n",
			["options"] = { ["silent"] = false },
		},
		{
			["action"] = require("telescope.builtin").buffers,
			["key"] = "<leader>pb",
			["mode"] = "n",
			["options"] = { ["silent"] = false },
		},
		{
			["action"] = require("telescope.builtin").find_files,
			["key"] = "<leader>pf",
			["mode"] = "n",
			["options"] = { ["silent"] = false },
		},
		{
			["action"] = require("telescope.builtin").grep_string,
			["key"] = "<leader>pg",
			["mode"] = "n",
			["options"] = { ["silent"] = false },
		},
		{
			["action"] = require("telescope.builtin").live_grep,
			["key"] = "<leader>ps",
			["mode"] = "n",
			["options"] = { ["silent"] = false },
		},
		{
			["action"] = vim.diagnostic.goto_next,
			["key"] = "<leader>dj",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = vim.diagnostic.goto_prev,
			["key"] = "<leader>dk",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = vim.diagnostic.open_float,
			["key"] = "<leader>ds",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{
			["action"] = vim.lsp.buf.code_action,
			["key"] = "<leader>ca",
			["mode"] = "n",
			["options"] = {
				["silent"] = true,
			},
		},
		{ ["action"] = vim.lsp.buf.rename, ["key"] = "<leader>r", ["mode"] = "n", ["options"] = { ["silent"] = true } },
		{ ["action"] = vim.lsp.buf.hover, ["key"] = "K", ["mode"] = "n", ["options"] = { ["silent"] = true } },
		{ ["action"] = vim.lsp.buf.definition, ["key"] = "gd", ["mode"] = "n", ["options"] = { ["silent"] = true } },
		{
			["action"] = vim.lsp.buf.implementation,
			["key"] = "gi",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{ ["action"] = vim.lsp.buf.references, ["key"] = "gr", ["mode"] = "n", ["options"] = { ["silent"] = true } },
		{
			["action"] = vim.lsp.buf.type_definition,
			["key"] = "gt",
			["mode"] = "n",
			["options"] = { ["silent"] = true },
		},
		{ ["action"] = ":m '<-2<CR>gv=gv", ["key"] = "K", ["mode"] = "v" },
		{ ["action"] = ":m '>+1<CR>gv=gv", ["key"] = "J", ["mode"] = "v" },
		{ ["action"] = "<cmd>copen<cr>", ["key"] = "<leader>o", ["mode"] = "" },
		{ ["action"] = "<cmd>cclose<cr>", ["key"] = "<leader>q", ["mode"] = "" },
		{ ["action"] = "<cmd>cnext<cr>", ["key"] = "<leader>j", ["mode"] = "" },
		{ ["action"] = "<cmd>cprevious<cr>", ["key"] = "<leader>k", ["mode"] = "" },
		{ ["action"] = vim.cmd.UndotreeToggle, ["key"] = "<leader>u", ["mode"] = "" },
		{
			["action"] = function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end,
			["key"] = "<leader>gw",
			["mode"] = "",
		},
		{
			["action"] = function()
				require("telescope").extensions.git_worktree.create_git_worktree()
			end,
			["key"] = "<leader>gaw",
			["mode"] = "",
		},
		{ ["action"] = "<cmd>Git<cr>", ["key"] = "<leader>gs", ["mode"] = "" },
		{ ["action"] = "<cmd>G add .<cr>", ["key"] = "<leader>ga", ["mode"] = "" },
		{
			["action"] = function()
				vim.cmd({
					cmd = "FloatermNew",
					args = {
						"--height=0.9",
						"--width=0.9",
						vim.fn.input("cmd > "),
					},
				})
			end,
			["key"] = "<leader>nt",
			["mode"] = "",
		},
		{ ["action"] = "<C-\\><C-n>", ["key"] = "<Esc><Esc>", ["mode"] = "t" },
		{ ["action"] = "<cmd>Oil --float<cr>", ["key"] = "<leader>pe", ["mode"] = "" },
	}
	for i, map in ipairs(__nixvim_binds) do
		vim.keymap.set(map.mode, map.key, map.action, map.options)
	end
end
-- }}}

do
	local cmds = { ["T"] = { ["command"] = "split | term <args>", ["options"] = { ["nargs"] = "*" } } }
	for name, cmd in pairs(cmds) do
		vim.api.nvim_create_user_command(name, cmd.command, cmd.options or {})
	end
end

require("lspconfig").ocamllsp.setup({})

-- Set up autocommands {{
do
	local __nixvim_autocommands = {
		{
			["callback"] = function()
				require("lint").try_lint()
			end,
			["event"] = "BufWritePost",
		},
		{
			["callback"] = function()
				vim.highlight.on_yank({
					timeout = 40,
				})
			end,
			["event"] = "TextYankPost",
			["pattern"] = "*",
		},
		{
			["callback"] = function()
				vim.cmd("startinsert")
			end,
			["event"] = "TermOpen",
			["pattern"] = "*",
		},
	}

	for _, autocmd in ipairs(__nixvim_autocommands) do
		vim.api.nvim_create_autocmd(autocmd.event, {
			group = autocmd.group,
			pattern = autocmd.pattern,
			buffer = autocmd.buffer,
			desc = autocmd.desc,
			callback = autocmd.callback,
			command = autocmd.command,
			once = autocmd.once,
			nested = autocmd.nested,
		})
	end
end
-- }}
