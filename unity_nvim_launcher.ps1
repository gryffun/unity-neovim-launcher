param($Script, $Line)

$server = "\\.\pipe\nvim-pipe" 

if (Test-Path $server) {
    nvim --server $server --remote-send "<Cmd>tabnew $Script | $Line<CR>"
} else {
    # Fallback: start a new instance if no server is found
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "nvim --listen $server '$Script' +$Line"
}






























