#!/usr/bin/bash

# Define variables
SCRIPT_DIR="$HOME/cs1102-scripts"
SCRIPT_FILE="cs1102rc.sh"
SCRIPT_PATH="$SCRIPT_DIR/$SCRIPT_FILE"
SCRIPT_URL="http://example.com/cs1102rc.sh" # Replace with actual URL

install() {
    # Create the directory if it doesn't exist
    if [ ! -d "$SCRIPT_DIR" ]; then
        mkdir -p "$SCRIPT_DIR"
    fi

    # Download the file if it doesn't exist
    if [ ! -f "$SCRIPT_PATH" ]; then
        echo "Downloading $SCRIPT_FILE to $SCRIPT_DIR..."
        curl -o "$SCRIPT_PATH" "$SCRIPT_URL"
        chmod +x "$SCRIPT_PATH"
    else
        echo "$SCRIPT_FILE already exists in $SCRIPT_DIR."
    fi

    # Check if the sourcing logic exists in ~/.profile
    if ! grep -q "source \$HOME/cs1102-scripts/cs1102rc.sh" "$HOME/.profile"; then
        echo "Adding sourcing logic to ~/.profile..."
        echo "if [ -f \"$HOME/cs1102-scripts/cs1102rc.sh\" ]; then" >> "$HOME/.profile"
        echo "    source \"$HOME/cs1102-scripts/cs1102rc.sh\"" >> "$HOME/.profile"
        echo "else" >> "$HOME/.profile"
        echo "    echo \"cs1102rc.sh not found. Do you want to remove the script? (y/n)\"" >> "$HOME/.profile"
        echo "    read -r response" >> "$HOME/.profile"
        echo "    case \$response in" >> "$HOME/.profile"
        echo "        [Yy]* ) rm -f \"$HOME/cs1102-scripts/cs1102rc.sh\" ;;" >> "$HOME/.profile"
        echo "        * ) echo \"Skipping removal.\" ;;" >> "$HOME/.profile"
        echo "    esac" >> "$HOME/.profile"
        echo "fi" >> "$HOME/.profile"
    else
        echo "Sourcing logic already exists in ~/.profile."
    fi

    echo "Installation complete."
}

update() {
    if [ -f "$SCRIPT_PATH" ]; then
        echo "Removing existing $SCRIPT_FILE..."
        rm -f "$SCRIPT_PATH"
    fi

    echo "Downloading latest $SCRIPT_FILE..."
    curl -o "$SCRIPT_PATH" "$SCRIPT_URL"
    chmod +x "$SCRIPT_PATH"
    echo "Update complete."
}

# Main script execution
case "$1" in
    install)
        install
        ;;
    update)
        update
        ;;
    *)
        echo "Usage: $0 {install|update}"
        exit 1
        ;;
esac
