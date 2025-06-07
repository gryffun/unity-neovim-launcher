param($Script, $Line)

# Start nvim at specific line using Start-Process
Start-Process powershell -ArgumentList "-NoExit", "-Command", "nvim '$Script' +$Line"
