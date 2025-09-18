
--
--

print("Hello from lua!")

-- setup cmp
local cmp=require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({select = true}),
       
    },
    sources = {
		{ name = 'nvim_lsp'},
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'cmdline' },
		{ name = 'luasnip' },

    },
})

-- :checkhealth  lsp
-- autocompletion is valid for lua not for clangd
-- for

vim.lsp.config["lua-language-server"] = {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json" },
	filetypes = { "lua" },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config["clangd"] = {

	cmd = { "clangd", 
			"--background-index",
	        "--clang-tidy",
	--		"--experimental-modules-support",
	},
	root_markers = { "compile_commands.json", "compile_flags.txt" , ".git"},
	filetypes = { "c", "cpp" },
	capabilities = capabilities,
}

vim.lsp.config["asm-lsp"] = {
	cmd = { "asm-lsp"},
	filetypes = { "asm", "vmasm","s","S" },
	root_markers = { ".asm-lsp.toml", ".git" },

}

vim.lsp.enable({"lua-language-server", "clangd", "asm-lsp",  })

vim.api.nvim_create_autocmd('LspAttach', {

	callback = function(ev)

		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true})

		end

	end

})

-- Add noselect to completeopt,otherwise autocompeltion is annoying
vim.cmd("set completeopt+=noselect")
vim.o.winborder = 'rounded'

vim.diagnostic.config({

	virtual_lines = true
})

vim.opt.termguicolors = true



---------------------------------------------
vim.opt.smarttab=true
vim.opt.expandtab=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4


