# Neovim Config
Personal neovim configs used for C++ developmet.

### Packages
Using packer as the package manager.
- packer
- telescope
- treesiter
- undotree
- vim-fugitive
- kanagawa
- lsp-zero
- mason
- nvim-tree
- presence
- nvim-colorizer
- autoclose

### Structure
```
├── after
│   └── plugin
│       ├── colors.lua
│       ├── fugitive.lua
│       ├── lsp.lua
│       ├── telescope.lua
│       ├── tree.lua
│       ├── treesitter.lua
│       └── undotree.lua
├── init.lua
├── lua
│   └── vid
│       ├── init.lua
│       ├── packer.lua
│       ├── remap.lua
│       └── set.lua
├── plugin
│   └── packer_compiled.lua
└── README.md
```
