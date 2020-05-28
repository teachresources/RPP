#!/bin/bash
dt=$(date '+%d/%m/%Y %H:%M:%S')

git pull
git add -A :/
git commit -m "$dt" 
git push 
echo "Committed/pushed changes to  GitHub"
