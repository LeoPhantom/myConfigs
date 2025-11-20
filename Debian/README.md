################################################################
#                                                              #
#                   i3lock-color Installation                  #
#                     and Configuration Guide                  #
#                                                              #
################################################################

The `install.sh` script will install all the necessary configurations,
but you still need to manually install `i3lock-color` from the GitHub
repository: 

    https://github.com/Raymo111/i3lock-color?ref=itsfoss.com

The script used for installation can be found in the `/configs/script` 
directory. However, it **will not** automatically copy it to `~/.config/scripts`,
so you need to do this manually. 

**Important:** If you forget to install `i3lock-color`, the script may not work as expected.

### Additional Steps:
1. **Remove the default `i3lock`** package:
   
   To prevent conflicts, you need to remove the default `i3lock` by running:

   ```bash
   sudo apt remove i3lock


