# cs1102-lab-functions
Aliases and functions, for convenience

## Install
<!-- 
### Automatic
```
curl -sSL https://raw.githubusercontent.com/sounddrill31/cs1102-lab-functions/main/install.sh | bash -s -- install
```
-->
### Manual
<!-- ```
git clone https://github.com/sounddrill31/cs1102-lab-functions; cd cs1102-lab-functions
```
```
bash install.sh
```
Cleanup:
```
cd ..; rm -rf cs1102-lab-functions 
```
-->

copy the contents of cs1102rc.sh and place it in ~

then run ```echo "source ~/cs1102rc.sh" >> ~/.bashrc``` then ```source ~/.bashrc```

# Commands
Here's a summary of the functions and aliases in a markdown table:

| Type | Name | Description |
|------|------|-------------|
| Alias | `bc` | Shortcut for `batcat` |
| Alias | `t` | Shortcut for `tmux` |
| Function | `submit` | Executes a script (default: script.sh) with execute permissions |
| Alias | `show` | Shortcut for `synchro show` |
| Alias | `initial` | Shortcut for `synchro init` |
| Function | `mkqn` | Creates a directory for CS1102 questions, enters it and runs `synchro init` |
| Alias | `status` | Shortcut for `synchro status` |