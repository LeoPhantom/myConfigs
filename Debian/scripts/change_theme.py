import os
import argparse

PATH = "/home/silver/.config/alacritty/alacritty.toml"

# Make this a *list* so indexes are stable
new_themes = ["inferno", "campbell", "dracula", "tokyo_night","tokyo_night_enhanced" ]

parser = argparse.ArgumentParser(description="Change Alacritty theme.")
parser.add_argument('-t', '--theme', '-n', help="Select the theme to apply.")
parser.add_argument('-l', '--list', action='store_true', help="List available themes.")
args = parser.parse_args()

if args.list:
    for i, theme in enumerate(new_themes):
        print(f"{i}: {theme}")
    exit(0)

new_theme = args.theme

def change_theme(new_theme):
    try:
        # Read the original file
        with open(PATH, "r") as file:
            content = file.readlines()

        # Find and update the theme import line
        for i, line in enumerate(content):
            if line.strip().startswith('import = ['):
                content[i + 1] = f'    "~/.config/alacritty/themes/themes/{new_theme}.toml"\n'
                break

        with open(PATH, "w") as file:
            file.writelines(content)

        print(f"Theme changed to {new_theme} successfully!")

    except FileNotFoundError:
        print(f"Error: The file {PATH} was not found.")
    except Exception as e:
         print(f"An unexpected error occurred: {e}")


# --- Logic to choose theme ---
# If input is a number: use it as index
if new_theme.isdigit():
    index = int(new_theme)

    if 0 <= index < len(new_themes):
        new_theme = new_themes[index]
    else:
        print("Error: Theme index out of range.")
        exit(1)


# Apply theme
change_theme(new_theme)

