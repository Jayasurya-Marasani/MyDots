#!/bin/bash

# Exit the script if any command fails
set -e

# Tokyo Night-inspired colors (using ANSI escape sequences)
BLUE='\033[38;5;75m'      # Light blue
MAGENTA='\033[38;5;170m'  # Soft magenta
GREEN='\033[38;5;114m'    # Soft green
YELLOW='\033[38;5;180m'   # Pale yellow
RED='\033[38;5;203m'      # Soft red
NC='\033[0m'              # No Color / reset

# Add all changes to staging
echo -e "${BLUE}🔄 Adding changes to staging...${NC}"
git add .

# Prompt the user for a commit message
echo -ne "${YELLOW}✏️  Enter commit message: ${NC}"
read commit_message

# Check if input is empty
if [ -z "$commit_message" ]; then
  echo -e "${RED}❌ Error: Commit message cannot be empty.${NC}"
  exit 1
fi

# Commit the changes
echo -e "${MAGENTA}📝 Committing changes...${NC}"
git commit -m "$commit_message"

# Push to the 'origin' branch
echo -e "${BLUE}📤 Pushing to origin...${NC}"
git push origin main  # Replace 'main' with your branch name if needed

# Success message
echo -e "${GREEN}✅ Code successfully pushed to GitHub!${NC}"
