# Unity-Neovim Linker

This is a simple way to get Unity to link with Neovim with some of the functionality of the supported external editors.


# Windows

unity_nvim_launcher.exe works to link Unity and Neovim on windows.

You have to set ***unity_nvim_launcher.exe*** as the external editor in:
<pre> Edit > Preferences > External Tools > External Script Editor </pre>
and pass as the editor args underneath: 
<pre> $(File) +$(Line) </pre> 

I have included the .ps1 file if you'd rather build it yourself. I used [PS2EXE](https://github.com/MScholtes/PS2EXE).
Essentially you can run this command after cding to the location of the ps1 file:
<pre> ps2exe .\unity_nvim_launcher.ps1 .\unity_nvim_launcher.exe </pre>

The major problem I had with getting Neovim to work with Unity is that Unity wont pass arguments to anything which doesn't have a GUI subsystem flag in Windows (or something like that I'm honestly not too familiar with windows subsystem things) so it kind of will open it if you build this some other way but wont go to the right place. This is the easiest way I found. You could design some other way to build a GUI subsystem flag into something and do some gymnastics but this worked for me.