#!/bin/bash

# Set up VsCode config directory
VSCODE_DIR="./.vscode"

# Capture the current working directory
CURRENT_DIR=$(pwd)

# Print current working directory for confirmation
echo "Current directory: $CURRENT_DIR"

# Create the VSCODE_DIR directory if it doesn't exist
mkdir -p "$VSCODE_DIR"

# Start creating the rpg_language.code-workspace file
cat << EOF > "$VSCODE_DIR/rpg_language.code-workspace"
{
    "folders": [
EOF

# Add chapters entries
cat << EOF >> "$VSCODE_DIR/rpg_language.code-workspace"
        {
            "name": "chapter_1",
            "path": "$CURRENT_DIR/chapter_1"
        },
EOF

# Close the folders array and add settings
cat << EOF >> "$VSCODE_DIR/rpg_language.code-workspace"
    ],
    "settings": {
        "IBM i Project Explorer.projectScanDepth": 2
    }
}
EOF

echo "rpg_language.code-workspace file has been generated in $VSCODE_DIR directory"