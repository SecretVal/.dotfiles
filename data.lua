local list = require("nvim-treesitter.parsers").get_parser_configs()
list.ul = {
	install_info = {
		url = "https://github.com/secretval/tree-sitter-u-lang",
		files = { "src/parser.c" },
		branch = "master",
	},
}
vim.treesitter.language.register("ul", "u_lang")
