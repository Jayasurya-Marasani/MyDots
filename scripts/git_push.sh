#!/bin/bash

# Exit the script if any command fails
set -e

# Tokyo Night-inspired ANSI colors
BLUE='\033[38;5;75m'      # Info (light blue)
MAGENTA='\033[38;5;170m'  # Commit (soft magenta)
GREEN='\033[38;5;114m'    # Success
YELLOW='\033[38;5;180m'   # Prompt
RED='\033[38;5;203m'      # Error
NC='\033[0m'              # Reset

# Nerd Font icons
ICON_ADD=""     # nf-oct-diff_added
ICON_COMMIT=""  # nf-dev-git_commit
ICON_PUSH=""    # nf-fa-upload
ICON_SUCCESS="" # nf-fa-check
ICON_ERROR=""   # nf-fa-times
ICON_PROMPT=""  # nf-oct-terminal

# Add all changes to staging
echo -e "${BLUE}${ICON_ADD} Adding changes to staging...${NC}"
git add .

# Prompt the user for a commit message
echo -ne "${YELLOW}${ICON_PROMPT} Enter commit message: ${NC}"
read commit_message

# Check if input is empty
if [ -z "$commit_message" ]; then
  echo -e "${RED}${ICON_ERROR} Error: Commit message cannot be empty.${NC}"
  exit 1
fi

# Commit the changes
echo -e "${MAGENTA}${ICON_COMMIT} Committing changes...${NC}"
git commit -m "$commit_message"

# Push to the 'origin' branch
echo -e "${BLUE}${ICON_PUSH} Pushing to origin...${NC}"
git push origin main  # Replace 'main' with your branch name if needed

# Success message
echo -e "${GREEN}${ICON_SUCCESS} Code successfully pushed to GitHub!${NC}"
