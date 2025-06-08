# Getting Unity To Use Neovim As External Editor

This is a simple way to get Unity to link with Neovim with some of the functionality of the supported external editors. I was having trouble finding answers on how to do it online myself. Hope this helps someone.

Currently this only contains the files to configure it for Windows, as that's what I use.

# Windows

unity_nvim_launcher.exe works to link Unity and Neovim on windows.

You have to set ***unity_nvim_launcher.exe*** as the external editor in:
<pre> Edit > Preferences > External Tools > External Script Editor </pre>
and pass as the editor args underneath: 
<pre> $(File) $(Line) </pre> 

I have included the .ps1 file if you'd rather build it yourself or want to customise it at all. I used [PS2EXE](https://github.com/MScholtes/PS2EXE).
Essentially you can run this command after cding to the location of the ps1 file:
<pre> ps2exe .\unity_nvim_launcher.ps1 .\unity_nvim_launcher.exe </pre>

# Linux

I don't know if this is an issue on Linux as I haven't tested it yet. I will get around to setting up a Linux version at some point but I don't use Unity on my Linux set up rn so don't really need to yet.

# Nice stuff to have with it

[barbar.nvim](https://github.com/romgrk/barbar.nvim) makes the tabs look nice heavily recommend it as part of your Neovim config if using Unity.

I do have my own [nvim-config](https://github.com/gryffun/nvim_config) which includes this. This is completely my personal taste but does work well for me. This also includes information and facts I have personally found useful in understanding Neovim configuration so if you're new to Neovim set ups and want to configure it on your own I also recommend checking it out.

# More info for those who care

Please bear in mind I'm not experienced working with Windows at a low level so what I'm saying might only be partially true, but its good enough for a solution which is all that counts to me.

## The Problem

There are 3 big problems that I started with. 
1. Unity won't just open nvim.exe in its own instance on its own when you pass it as an external editor. For that matter, cmd.exe or powershell also don't start up. Unity calls Process.Start() on the external editor exe its passed on windows which start up the process but doesn't attach it to a console session so it doesn' really achieve anything and just closes (I assume this is what happens anyway but I couldnt figure out a way to get a log file to see what was happening).
2. Unity won't link non-exes as an external editor so you can't just call a .bat file or something and have it open a cmd and pass all the stuff you need.
3. If you can manage to get Neovim to open in a command line of some kind Unity won't pass the editor args, so it isn't pointed to the correct file or line you're trying to open.

## The Solution

We need to do some things then:
1. Open a window which actually stays up and doesn't silently fail
2. Link to an exe
3. Be able to pass the editor args
4. Make it so that anytime you click a new file it goes to the same Neovim thats already open instead of opening a new instance everytime.

So a simple solution is to build a .exe of a .ps1 which sets up a neovim instance which is pointed to each time you open a new file from Unity.

Unity wont pass editor arguments to anything which doesn't have a GUI subsystem flag in Windows (or something like that I'm honestly not too familiar with windows subsystem things). It will if you build a GUI application so this is what I did using [PS2EXE](https://github.com/MScholtes/PS2EXE). 