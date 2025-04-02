# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands
- Format: `:Format` - Format current buffer with LSP/conform.nvim
- Linting: Use LSP diagnostics (no specific command)
- ToggleESLint: `:ToggleESLint` - Toggle ESLint server on/off
- TypeScript: `:TSC` - Run TypeScript compiler

## Code Style Guidelines
- **Naming**: Use snake_case for variables and functions
- **Functions**: Use function expressions with local keyword
- **Modules**: Return a table (M) for module exports
- **Keymaps**: Define using wrapper functions from keymap_utils.lua
- **Imports**: Use require() at the top of files
- **Formatting**: Use stylua for Lua, prettierd/prettier for JS/TS
- **Comments**: Add descriptive comments for functions/keymaps
- **Error Handling**: Use vim.notify for user-facing errors
- **Plugin Config**: Define in separate files under lua/plugins/
- **User Config**: Organize in modules under lua/user/

## Best Practices
- Follow existing patterns in similar files
- Use dedicated utility functions for recurring operations
- Add descriptions to keymaps for which-key integration