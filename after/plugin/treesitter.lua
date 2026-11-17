--require'nvim-treesitter.configs'.setup {
  ---- A list of parser names, or "all" (the five listed parsers should always be installed)
  --ensure_installed = "all",

  ---- Install parsers synchronously (only applied to `ensure_installed`)
  --sync_install = false,

  ---- Automatically install missing parsers when entering buffer
  ---- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  --auto_install = true,

  ---- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },

  ------ If you need to change the installation directory of the parsers (see -> Advanced Setup)
  ---- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  --highlight = {
    --enable = true,

    --additional_vim_regex_highlighting = false,
  --},

  --indent = {
      --enable = true,
  --}
--}
require('nvim-treesitter').install({
    'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'typescript',
    'tsx', 'rust', 'c', 'cpp', 'yaml', 'toml',
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
