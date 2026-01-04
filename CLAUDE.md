# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **fork of the zed-twig extension** adapted to provide **Smarty language support** for the Zed editor. Smarty shares similar syntax with Twig (template delimiters, variable interpolation, etc.), which makes this fork a good starting point.

## Build and Development Commands

### Build the extension
```bash
cargo build --release
```

This compiles the Rust extension code in `src/lib.rs` and produces the extension binary.

### No tests or linter configured
Currently, this project does not have test or lint commands configured. Check the parent Twig extension for any development practices that should be adopted.

## Architecture

This is a **Zed extension** that provides language support through multiple components:

### 1. Extension Code (`src/lib.rs`)
The Rust extension code implements the `zed::Extension` trait. Its main responsibilities:
- **Language server management**: Downloads and runs the LSP binary via npm
- Currently uses `twiggy-language-server` (v0.17.0) which needs to be replaced with a Smarty-compatible LSP
- The extension checks for the LSP server in `node_modules/twiggy-language-server/dist/server.js`
- If not present or outdated, it downloads the specified version using `zed::npm_install_package`

Key constants to update for Smarty:
- `SERVER_PATH`: Path to the Smarty LSP server
- `PACKAGE_NAME`: npm package name for the Smarty LSP

### 2. Language Configuration (`languages/` directory)
Each language requires a subdirectory in `languages/` with:
- **`config.toml`**: Language metadata (name, file extensions, brackets, comments, etc.)
- **`highlights.scm`**: Tree-sitter query for syntax highlighting
- **`brackets.scm`**: Tree-sitter query for bracket matching (auto-closing pairs)
- **`injections.scm`**: Rules for embedding other languages (e.g., HTML within Smarty templates)
- **Other `.scm` files**: Optional queries for outline, indents, textobjects, etc.

Current structure:
```
languages/
├── twig/           # Twig configuration (needs Smarty adaptation)
    ├── config.toml
    ├── highlights.scm
    ├── brackets.scm
    └── injections.scm
```

### 3. Extension Manifest (`extension.toml`)
Defines:
- Extension metadata (id, name, version, description)
- **Grammar repository**: Points to the tree-sitter grammar for syntax parsing
  - Current: `https://github.com/jannisborgers/tree-sitter-twig`
  - Needs: A tree-sitter grammar for Smarty
- **Language server declarations**: Maps LSP to supported languages

### 4. Dependencies (`Cargo.toml`)
- `zed_extension_api = "0.7.0"`: The Zed extension API version
- Crate type: `cdylib` (dynamic system library for Zed to load)

## Key Differences: Twig vs Smarty

While both are template engines, there are syntax differences to address:

### Delimiters
- **Twig**: `{{ ... }}` for output, `{% ... %}` for logic, `{# ... #}` for comments
- **Smarty**: Similar but may have variations in whitespace control modifiers

### Syntax Features
- Variable access and filters/modifiers differ
- Built-in functions and control structures have different names
- Tag names and attributes vary

### File Extensions
- **Twig**: `.html.twig`, `.twig`, `.twig.html`
- **Smarty**: Typically `.tpl`, `.smarty`

## Adaptation Checklist

To complete the Twig → Smarty adaptation:

1. **Update `extension.toml`**:
   - Change extension id, name, and description
   - Update grammar repository to point to a Smarty tree-sitter grammar
   - Update language server name

2. **Create `languages/smarty/` directory** with adapted config:
   - Adapt `config.toml` for Smarty file extensions and delimiters
   - Modify `highlights.scm` for Smarty-specific syntax nodes
   - Update `brackets.scm` if Smarty has different bracket pairs
   - Adjust `injections.scm` for HTML embedding if needed

3. **Update `src/lib.rs`**:
   - Change `SERVER_PATH` and `PACKAGE_NAME` to point to a Smarty LSP
   - Update the struct name from `TwigExtension` to `SmartyExtension`
   - Modify extension registration

4. **Update `Cargo.toml`**:
   - Change package name from `zed-twig` to `zed-smarty`

## Reference Documentation

- **Zed extension development**: https://zed.dev/docs/extensions/languages
- **Tree-sitter queries**: Used for syntax highlighting, bracket matching, code outline, etc.
- **Zed extension API**: Methods available in the `zed::Extension` trait

## Credits

Original Twig extension uses:
- https://github.com/gbprod/tree-sitter-twig for syntax highlighting
- https://github.com/moetelo/twiggy for the language-server
