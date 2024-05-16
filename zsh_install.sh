echo "___Installing___"
sudo apt -qq update &> /dev/null
echo " -> installing zsh"
sudo apt -qq install zsh &> /dev/null

echo " -> setting zsh as std-shell (you will need your login-password)"
chsh $(which zsh)

echo " -> installing oh-my-zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
