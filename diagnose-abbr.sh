#!/bin/bash
echo "=========================================="
echo "zsh-abbr Diagnostics"
echo "=========================================="

echo ""
echo "--- 1. zsh version ---"
zsh --version

echo ""
echo "--- 2. zsh-abbr version/head ---"
cd ~/.zsh-abbr && git describe --tags 2>/dev/null; git log --oneline -1; cd - > /dev/null

echo ""
echo "--- 3. zsh-abbr file header ---"
head -10 ~/.zsh-abbr/zsh-abbr.zsh

echo ""
echo "--- 4. Dependencies directory ---"
ls -la ~/.zsh-abbr/dependencies/ 2>/dev/null || echo "No dependencies directory found"

echo ""
echo "--- 5. Registered abbr widgets ---"
zsh -ic 'zle -la 2>/dev/null | grep -i abbr' 2>/dev/null || echo "No abbr widgets found"

echo ""
echo "--- 6. All registered widgets (space-related) ---"
zsh -ic 'zle -la 2>/dev/null | grep -i space' 2>/dev/null || echo "No space widgets found"

echo ""
echo "--- 7. Space key binding ---"
zsh -ic 'bindkey " "' 2>/dev/null || echo "Could not read space binding"

echo ""
echo "--- 8. zsh-abbr grep for widget definitions ---"
grep -r "zle -N" ~/.zsh-abbr/ 2>/dev/null | head -20

echo ""
echo "--- 9. zsh-abbr grep for bindkey ---"
grep -r "bindkey" ~/.zsh-abbr/ 2>/dev/null | head -20

echo ""
echo "--- 10. Current .zshrc ---"
cat ~/.zshrc

echo ""
echo "=========================================="
echo "Diagnostics complete"
echo "=========================================="
