# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2025-01-03

### Added
- Initial Smarty support for Zed
- Syntax highlighting via custom tree-sitter-smarty fork
- Support for both default `{}` and custom `{{}}` delimiters
- LSP integration with vscode-smarty-langserver-extracted
- Auto-closing brackets for all delimiter styles
- Code completion for Smarty functions and modifiers
- Diagnostics for syntax errors
- HTML embedding support
- File extensions: `.tpl`, `.smarty`

### Credits
- Forked from [zed-twig](https://github.com/YussufSassi/zed-twig)
- Uses [vscode-smarty-langserver-extracted](https://github.com/landeaux/vscode-smarty-langserver-extracted)
- Uses forked [tree-sitter-smarty](https://github.com/alsur/tree-sitter-smarty)
