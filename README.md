# jrmkeys
global hotkeys for some useful actions, using autohotkeys and compatible with Windows 10. includes some other tools to help install [chocolatey] package manager and [autohotkeys]. 

## overview

### tools 

[autohotkey] is a great program allowing incredibly powerful customization in a relatively simple and easy scripting language. 

[Chocolatey] is a package manager for Windows which allows painless, silent installs of a majority of common and popular software. installing multiple programs is easy, e.g. `choco install -y firefox steam winamp vcredist-all` installs several popular programs, as well as the entire collection of visual code redistributable libraries. 

### hotkey program

as the web and security in general advance, it can get somewhat annoying to type and retype passwords in, especially as applications increasingly set expirations on logins, but also require increasingly complex passwords. 

this script, when run, will sit in the taskbar and do three things:
- Read 4 lines of a text file and assign each line to a hotkey 
- Assign hotkeys to some common applications
- Assign hotkeys to some lesser-known window GUI hacks 

## password / string loader

## WARNING!

first, a general warning: **this will require storing passwords in a plaintext file on your computer.** do not **ever** use this for any password that allows direct access to banking accounts, your main email, et cetera. 

### description

the script will look for a file called `var.txt`, which by default will be located in your Home directory `C:/Users/yourname/var.txt`. it will run a loop and assign each line to its own variable. 

by default i have 4 keys setup. they are triggered by pressing `Ctrl`+`Win`+{`F5` through `F8`}.

**@TODO** 
- play with input speed
- more testing to ensure no quirks - ie start menu popping up, input being interrupted, etc

## program hotkeys

Launches an application using the `Win` modifier and `Ins` or `Del`. 

I always have desktop icons hidden, so I keep shortcuts in the Desktop folder and then designate them in the script. 

~~~
#Ins::
sleep, 150
Run, C:\Users\%A_UserName%\Desktop\WSL.lnk,,, process_id
;sleep, 150
WinWait, ahk_pid %process_id%
WinActivate, ahk_pid %process_id%
return
~~~

The above method is a more rugged method compared to simply using the `Run` command. Authotkey sometimes loses the window's focus when it launches, which can be a hassle when you're expecting to immediately be able to start typing something but have to stop and click or alt-tab back to the window. 

To make sure focus is kept, when the application is run the process id is stored as a temporary variable. `WinWait` and `WinActivate` are commands that can grab window focus, so we target the launched application with them. 

Sometimes, using the `sleep` command to pause the script briefly (here, 150ms) will also help. After the `Run` command, autohotkey fires off a sort of 'rapid pulse' of attempts to capture window focus. Alot of quirks with autohotkey can be worked around by forcing scripts to pause for a bit, as the operating system sometimes 'misses' inputs while processing other actions. 

**@TODO**
- GUI frontend to select hotkey shortcut targets while script is running

## GUI hacks 

### enable and disable focused window transparency

### enable and disable focused window's title bar

[autohotkey]:https://autohotkey.com
[chocolatey]:https://chocolatey.org
