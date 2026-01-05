# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2025-01-04

### Added

#### Complete Smarty 3 Support
- ✅ **All control structures**: `{if}/{elseif}/{else}`, `{foreach}`, `{for}`, `{while}`
- ✅ **All built-in functions**: `{include}`, `{block}`, `{literal}`, `{function}`, `{call}`, `{capture}`, `{nocache}`
- ✅ **Full delimiter support**: Both `{}` and `{{}}` styles work simultaneously
- ✅ **Syntax highlighting** via enhanced tree-sitter grammar
- ✅ **Auto-closing brackets**: `{}`, `{{}}`, `[]`, `()`, strings
- ✅ **HTML embedding**: HTML within templates is properly highlighted
- ✅ **Modifier support**: `{$var|upper}`, `{{$var|truncate:30}}`, etc.

#### Grammar Features
- Enhanced tree-sitter grammar with **full Smarty 3 coverage**
- Support for double delimiters `{{}}` via regex patterns
- All major Smarty 3 built-in functions implemented
- Custom fork: [alsur/tree-sitter-smarty](https://github.com/alsur/tree-sitter-smarty)
- Grammar commit: `7819ebb8cb690e77c0f8c676b93f488fca388106`

#### File Extensions
- `.tpl` - Smarty template files
- `.smarty` - Smarty template files

#### Technical Details
- **Extension API**: Zed 0.7.0
- **Tree-sitter queries**: highlights.scm, injections.scm
- **Rust extension**: src/lib.rs
- **Language config**: languages/smarty/config.toml

### Control Structures Supported

| Structure | Syntax | Status |
|-----------|--------|--------|
| Conditionals | `{{if}}`, `{{elseif}}`, `{{else}}`, `{{/if}}` | ✅ Complete |
| Foreach loops | `{{foreach}}`, `{{foreachelse}}`, `{{/foreach}}` | ✅ Complete |
| For loops | `{{for}}`, `{{forelse}}`, `{{/for}}` | ✅ Complete |
| While loops | `{{while}}`, `{{/while}}` | ✅ Complete |

### Built-in Functions Supported

| Function | Purpose | Status |
|----------|---------|--------|
| `{include}` | Include templates | ✅ |
| `{block}` | Template inheritance | ✅ |
| `{literal}` | Literal content (no parsing) | ✅ |
| `{function}` | Define template functions | ✅ |
| `{call}` | Call template functions | ✅ |
| `{capture}` | Capture output | ✅ |
| `{nocache}` | Disable caching | ✅ |

### Notable Exclusions
- `{section}` - Legacy/obsolete (Smarty docs recommend using `{foreach}` instead)

### Credits
- **Base extension**: [zed-twig](https://github.com/YussufSassi/zed-twig) by Yussuf Sassi
- **Original grammar**: [Kibadda/tree-sitter-smarty](https://github.com/Kibadda/tree-sitter-smarty)
- **Enhanced fork**: [alsur/tree-sitter-smarty](https://github.com/alsur/tree-sitter-smarty)
- **Documentation**: [Smarty Official Docs](https://www.smarty.net/docs/en/)

### Development Notes

This extension was developed as a complete adaptation of the zed-twig extension to support the Smarty 3 template language. The tree-sitter grammar was significantly enhanced to support **all major Smarty 3 built-in functions** and both delimiter styles (`{}` and `{{}`).

The grammar modifications enable:
- Simultaneous support for standard and custom delimiters
- Full parsing of complex template structures
- Proper nesting and scoping of control structures
- Accurate syntax highlighting for all Smarty constructs
