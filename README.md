# Smarty for Zed

Smarty template language support for Zed editor.

## Features

- ✅ Syntax highlighting for Smarty templates (.tpl, .smarty)
- ✅ Support for custom delimiters ({{}} and {})
- ✅ Auto-closing brackets ({}, [], (), {{}})
- ✅ Code completion (via LSP)
- ✅ Diagnostics for common errors
- ✅ HTML embedded in templates

## Installation

### Development Installation (Current)

This extension is in development. To install it:

1. **Compile the extension** (first time only):
   ```powershell
   cd D:\webs\zed\zed-smarty
   cargo build --release
   ```

2. **Open Zed**

3. **Install as Dev Extension**:
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type: "Install Dev Extension"
   - Select the folder: `D:\webs\zed\zed-smarty`
   - Zed will compile and load the extension automatically

4. **Verify installation**:
   - Open any `.tpl` file
   - You should see "Smarty" in the status bar
   - The LSP will download automatically on first use

## Usage

### Supported Features

- **Variables**: `{$variable}`, `{{$variable}}`, `{$array.key}`
- **Modifiers**: `{$var|upper}`, `{{$var|truncate:30}}`
- **Control structures**: `{if}`, `{foreach}`, `{for}`, `{while}`, `{{if}}`, `{{foreach}}`
- **Comments**: `{* comment *}`
- **Literals**: `{literal}...{/literal}`

### File Extensions

- `.tpl` - Smarty template files
- `.smarty` - Smarty template files

### Delimiter Support

This extension supports both:
- **Default Smarty delimiters**: `{$var}`, `{if}`
- **Custom double delimiters**: `{{$var}}`, `{{if}}`

The bracket configuration prioritizes `{{}}` over `{}` for auto-closing.

## Development

### Build from Source

```powershell
cd D:\webs\zed\zed-smarty
cargo build --release
```

The compiled extension will be in `target/release/`.

### Project Structure

```
zed-smarty/
├── src/lib.rs              # Extension code (Rust)
├── languages/smarty/       # Language configuration
│   ├── config.toml        # Language metadata
│   ├── highlights.scm     # Syntax highlighting rules
│   ├── brackets.scm       # Bracket matching rules
│   └── injections.scm     # HTML embedding rules
├── tests/smarty/          # Test files
└── extension.toml         # Extension manifest
```

## Troubleshooting

### Extension doesn't load in Zed

1. **Check if it compiled**:
   ```powershell
   cd D:\webs\zed\zed-smarty
   cargo build --release
   ```
   Look for errors in the compilation output.

2. **Check Zed logs**:
   - Run Zed with logging: `zed --foreground`
   - Look for errors related to "smarty" or "extension"

3. **Reinstall the extension**:
   - `Ctrl+Shift+P` → "Dev Extensions: Remove"
   - Then reinstall: "Install Dev Extension"

### Syntax highlighting doesn't work

1. **Check file extension**: Make sure the file ends in `.tpl` or `.smarty`

2. **Check tree-sitter grammar**:
   - The grammar is downloaded from: https://github.com/alsur/tree-sitter-smarty
   - Commit: `ad286a041d941b05c46c4697655a75bcac2617ce`

3. **Reload Zed**: `Ctrl+Shift+P` → "Reload Window"

### LSP doesn't work

1. **Check if LSP downloaded**:
   - Zed will download `vscode-smarty-langserver-extracted` automatically
   - Check Zed logs for download status

2. **Test autocompletion**:
   - Open a `.tpl` file
   - Type `{{` - should show completions

## Credits

- [tree-sitter-smarty](https://github.com/Kibadda/tree-sitter-smarty) - Forked for {{}} support
  - Fork: [alsur/tree-sitter-smarty](https://github.com/alsur/tree-sitter-smarty)
- [vscode-smarty-langserver-extracted](https://github.com/landeaux/vscode-smarty-langserver-extracted) - LSP implementation
- Forked from [zed-twig](https://github.com/YussufSassi/zed-twig)

## License

MIT
