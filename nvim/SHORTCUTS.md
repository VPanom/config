# Nvim Shortcuts

## File Navigation
- `<Space>pv` - Toggle nvim-tree (file explorer)
- `<Space>cd` - Change root directory in nvim-tree (when in nvim-tree)
- `<Space>cf` - Find current file in nvim-tree
- `<Space>pf` - Find files (telescope)
- `<Ctrl-p>` - Git files (telescope)
- `<Space>ps` - Grep search (telescope)

## Buffer Management
- `Tab` - Next buffer
- `Shift+Tab` - Previous buffer
- `<Space>bd` - Close current buffer
- `<Space>bo` - Close all other buffers

## LSP (Language Server)
- `gd` - Go to definition
- `K` - Hover documentation
- `gi` - Go to implementation
- `<Ctrl-k>` - Signature help
- `<Space>lr` - Rename across project
- `<Space>ca` - Code actions
- `gr` - Find references
- `<Space>f` - Format code

## Git Signs
- `<Space>hj` - Next hunk (git change)
- `<Space>hg` - Previous hunk (git change)
- `<Space>hp` - Preview hunk
- `<Space>hs` - Stage hunk
- `<Space>hr` - Reset hunk
- `<Space>tb` - Toggle blame line

## Terminal
- `<Space>t` - Open terminal in new tab
- `<Esc>` - Exit terminal mode (when in terminal)

## Window Navigation
- `<Space><left>` - Move to left window
- `<Space><down>` - Move to down window
- `<Space><up>` - Move to up window
- `<Space><right>` - Move to right window
- `<Space><tab>` - Cycle through windows

## Comments
- `gcc` - Toggle comment on current line
- `gc` + motion - Comment motion (e.g. `gc3j` comments 3 lines down)
- `gbc` - Toggle block comment
- In Visual mode: select text → `gc` - comment selection
- `gco` - Add comment below current line
- `gcO` - Add comment above current line
- `gcA` - Add comment at end of line

## Code Movement
- `V` - Select entire line (line-wise visual)
- `v` - Select character by character
- `Ctrl+v` - Block selection
- In Visual mode: `J` - Move selection down
- In Visual mode: `K` - Move selection up
- `Alt+j` - Move current line down
- `Alt+k` - Move current line up

## Other
- `<F5>` - New tab
- `<F6>` - Previous tab
- `<F7>` - Next tab
- `<F8>` - Quit
- `<Space>+` - Increase window height
- `<Space>-` - Decrease window height
- `<Ctrl-h>` - Delete word backward (insert mode)