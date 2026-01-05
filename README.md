# Smarty for Zed

**Complete Smarty 3 template language support** for Zed editor with syntax highlighting, bracket matching, and HTML embedding.

## Features

- ✅ **Full Smarty 3 syntax highlighting** for templates (`.tpl`, `.smarty`)
- ✅ **All control structures**: `{if}`, `{foreach}`, `{for}`, `{while}`
- ✅ **All built-in functions**: `{include}`, `{block}`, `{literal}`, `{function}`, `{call}`, `{capture}`, `{nocache}`
- ✅ **Custom delimiter support**: Both `{}` and `{{}}` delimiters
- ✅ **Auto-closing brackets**: `{}`, `{{}}`, `[]`, `()`
- ✅ **HTML embedding**: HTML code within templates is highlighted correctly
- ✅ **Modifier support**: `{$var|upper}`, `{{$var|truncate:30}}`
- ✅ **LSP IntelliSense**: Code completion, diagnostics, and variable suggestions (via `vscode-smarty-langserver-extracted`)

## Installation

### As Dev Extension (Recommended)

1. **Open Zed**

2. **Install as Dev Extension**:
   - Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
   - Type: "Install Dev Extension"
   - Select the folder containing this extension
   - Zed will compile and load the extension automatically

3. **Verify installation**:
   - Open any `.tpl` file
   - You should see "Smarty" in the status bar
   - Syntax highlighting should work immediately

### From Extension Marketplace (Future)

Once published, you'll be able to install it directly from Zed's extension marketplace.

## Usage

### Supported Control Structures

All Smarty 3 control structures are fully supported:

#### Conditionals
```smarty
{{if $var > 10}}
    Greater than 10
{{elseif $var > 5}}
    Greater than 5
{{else}}
    Less than or equal to 5
{{/if}}
```

#### Loops
```smarty
{{foreach $items as $item}}
    {{$item.name}}
{{foreachelse}}
    No items
{{/foreach}}

{{for $i=0 to $10}}
    {{$i}}
{{/for}}

{{while $condition}}
    ...
{{/while}}
```

### Supported Built-in Functions

| Function | Purpose | Example |
|----------|---------|---------|
| `{include}` | Include other templates | `{include file="header.tpl"}` |
| `{block}` | Template inheritance | `{block name="content"}...{/block}` |
| `{literal}` | Literal content (no parsing) | `{literal}<script>{...}</script>{/literal}` |
| `{function}` | Define template functions | `{function name="link"}...{/function}` |
| `{call}` | Call template functions | `{call name="link" var="value"}` |
| `{capture}` | Capture output to variable | `{capture name="mycap"}...{/capture}` |
| `{nocache}` | Disable caching | `{nocache}...{/nocache}` |

### Variables and Modifiers

```smarty
{{$variable}}
{{$array.key}}
{{$variable|upper}}
{{$variable|truncate:30:"..."}}
{{$variable|default:"default value"}}
```

### Comments

```smarty
{* This is a Smarty comment *}
```

### File Extensions

- `.tpl` - Smarty template files
- `.smarty` - Smarty template files

### Delimiter Support

This extension supports **both** delimiter styles:

| Style | Example | Use Case |
|-------|---------|----------|
| **Default** | `{$var}`, `{if}` | Standard Smarty syntax |
| **Double** | `{{$var}}`, `{{if}}` | Custom delimiter configuration |

The bracket configuration prioritizes `{{}}` over `{}` for auto-closing. Both styles work simultaneously in the same file.

### HTML Embedding

HTML code within Smarty templates is automatically highlighted:

```smarty
{{if $show_header}}
    <header class="main-header">
        <h1>{{$title}}</h1>
    </header>
{{/if}}
```

## Development

### Build from Source

```bash
cd zed-smarty
cargo build --release
```

The compiled extension will be in `target/release/`.

### Project Structure

```
zed-smarty/
├── src/lib.rs              # Extension code (Rust)
├── languages/smarty/       # Language configuration
│   ├── config.toml        # Language metadata
│   ├── highlights.scm     # Syntax highlighting rules (tree-sitter queries)
│   └── injections.scm     # HTML embedding rules
├── tests/smarty/          # Test template files
├── extension.toml         # Extension manifest
└── Cargo.toml             # Rust dependencies
```

### Tree-sitter Grammar

This extension uses a custom fork of `tree-sitter-smarty` that supports both `{}` and `{{}}` delimiters:

- **Repository**: https://github.com/alsur/tree-sitter-smarty
- **Current Commit**: `d3e66413061437e59788ee9d3cd8f0376497bd38`
- **Base**: Forked from [Kibadda/tree-sitter-smarty](https://github.com/Kibadda/tree-sitter-smarty)

The grammar includes support for **all Smarty 3 built-in functions**:
- Control structures: `if`, `foreach`, `for`, `while`
- Built-in functions: `include`, `block`, `literal`, `function`, `call`, `capture`, `nocache`

### Updating the Grammar Commit

**Why manual updates are required:**
Zed requires a specific commit SHA (not `master` or tags) for security and reproducibility. This ensures that all users get the exact same grammar version.

**When to update:**
- After making changes to the grammar in `tree-sitter-smarty`
- When you want to use a newer version of the grammar

**How to update:**

1. **Make changes to the grammar** (if applicable):
   ```bash
   cd /path/to/tree-sitter-smarty
   # Edit grammar.js
   tree-sitter generate
   tree-sitter test
   git add .
   git commit -m "Description of changes"
   git push origin main
   ```

2. **Get the new commit SHA**:
   ```bash
   cd /path/to/tree-sitter-smarty
   git rev-parse HEAD
   # Output: d3e66413061437e59788ee9d3cd8f0376497bd38
   ```

3. **Update `zed-smarty/extension.toml`**:
   ```toml
   [grammars.smarty]
   repository = "https://github.com/alsur/tree-sitter-smarty"
   commit = "d3e66413061437e59788ee9d3cd8f0376497bd38"  # ← Update this
   ```

4. **Reload the extension in Zed**:
   - Zed will automatically detect the change and recompile
   - Or manually: `Ctrl+Shift+P` → "Reload Window"

**Important**: Always verify that the grammar commit you're pointing to includes all the nodes referenced in `languages/smarty/highlights.scm`.

## Troubleshooting

### Extension doesn't load in Zed

1. **Check if it compiled**:
   ```bash
   cargo build --release
   ```
   Look for errors in the compilation output.

2. **Check Zed logs**:
   - Run Zed with logging: `zed --foreground`
   - Look for errors related to "smarty" or "extension"

3. **Clean and reinstall**:
   - Close Zed completely
   - Remove cached extension:
     ```powershell
     Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Zed\extensions\dev\smarty"
     ```
   - Reinstall via "Install Dev Extension"

### Syntax highlighting doesn't work

1. **Check file extension**: Make sure the file ends in `.tpl` or `.smarty`

2. **Check language status**: Look for "Smarty" in Zed's status bar

3. **Verify tree-sitter grammar**:
   - Grammar is downloaded from: https://github.com/alsur/tree-sitter-smarty
   - Current commit: `d3e66413061437e59788ee9d3cd8f0376497bd38`

4. **Reload Zed**: `Ctrl+Shift+P` → "Reload Window"

### LSP (Language Server) Issues

The extension uses `vscode-smarty-langserver-extracted` for IntelliSense features:

**Common Error**: "Cannot read properties of undefined (reading 'storageDir')"

**Solution**: This has been fixed in the current version by implementing `language_server_initialization_options()` in `src/lib.rs`. The LSP now receives the required `storageDir: null` parameter during initialization.

**LSP Features** (when working correctly):
- Code completion for Smarty blocks and modifiers
- Variable completion within the same file
- Smarty plugin directory support
- XSS vulnerability warnings

**Note**: Syntax highlighting works independently of the LSP via tree-sitter, so even if the LSP fails, you'll still have full syntax highlighting.

### Brackets don't auto-close

1. **Check bracket configuration**: Open `languages/smarty/config.toml`
2. **Verify brackets list**: Should include `{`, `{{`, `[`, `(`, etc.
3. **Report issue**: If brackets are missing, open an issue on GitHub

## Credits

- [tree-sitter-smarty](https://github.com/Kibadda/tree-sitter-smarty) - Original grammar
  - **Fork with full Smarty 3 support**: [alsur/tree-sitter-smarty](https://github.com/alsur/tree-sitter-smarty)
  - Adds support for `{for}`, `{while}`, `{literal}`, `{function}`, `{call}`, `{capture}`
  - Supports both `{}` and `{{}}` delimiters
- [zed-twig](https://github.com/YussufSassi/zed-twig) - Extension template (forked base)
- [Smarty Documentation](https://www.smarty.net/docs/en/) - Official Smarty 3 documentation

This project has been heavily implemented with AI and Claude Code by [alsur.es](https://alsur.es)

## License

MIT


## See Also

- [Zed Editor](https://zed.dev) - The hackable code editor
- [Smarty 3 Documentation](https://www.smarty.net/docs/en/) - Official documentation
- [Tree-sitter](https://tree-sitter.github.io/) - Parser generator tool
