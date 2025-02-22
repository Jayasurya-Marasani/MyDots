#!/bin/bash

# Exit the script if any command fails
set -e

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color (reset)

# Check if a commit message is provided
if [ -z "$1" ]; then
  echo -e "${RED}Error: Commit message is required.${NC}"
  echo -e "${YELLOW}Usage: ./git_push.sh \"Your commit message\"${NC}"
  exit 1
fi

# Store the commit message from the first argument
commit_message="$1"

# Add all changes to staging
echo -e "${CYAN}Adding changes to staging...${NC}"
git add .

# Commit the changes
echo -e "${CYAN}Committing changes...${NC}"
git commit -m "$commit_message"

# Push to the 'origin' branch
echo -e "${CYAN}Pushing to origin...${NC}"
git push origin main  # Replace 'main' with your branch name if it's different

# Success message
echo -e "${GREEN}Code successfully pushed to GitHub!${NC}"
