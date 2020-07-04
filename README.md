# jrmkeys
global hotkeys for some useful actions, using autohotkeys and compatible with Windows 10

## overview
[autohotkey] is a great program allowing incredibly powerful customization in a relatively simple and easy scripting language. 

as the web and security in general advance, it can get somewhat annoying to type and retype passwords in, especially as applications increasingly set expirations on logins, but also require increasingly complex passwords. 

this script, when run, will sit in the taskbar and do three things:
- Read 4 lines of a text file and assign each line to a hotkey 
- Assign hotkeys to some common applications
- Assign hotkeys to some lesser-known window GUI hacks 

## password / string loader

### WARNING!
first, a general warning: **this will require storing passwords in a plaintext file on your computer.** do not **ever** use this for any password that allows direct access to banking accounts, your main email, et cetera. 

### ANOTHER WARNING! 
right now, the script parses the text file and reads it directly through autohotkey, which means **it will treat some characters as autohotkey scripting**. `!` and `^` in particular are treated as the `Alt` and `Ctrl` keys, respectively. This means if you store the string `foo!bar`, the script would type `foo` but then it would send `Alt`+`b`, which at a minimum is not what you wanted, but could also possibly activate a hotkey on any program you might have focused in the foreground.

if you store a string of text such as `foo!` or `bar^`, right now you must manually escape out of them with `{}` curly brackets. 

If you want to press a hotkey that will write out `foo!`, you would add:

`foo{!}`

to the `var.txt` file. 

### description

the script will look for a file called `var.txt`, which by default will be located in your Home directory `C:/Users/yourname/var.txt`. it will run a loop and assign each line to its own variable. 

by default i have 4 keys setup. they are triggered by pressing `Ctrl`+`Win`+{`F5` through `F8`}.


