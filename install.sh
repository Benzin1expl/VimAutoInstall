echo "___Installing dependencies___"
sudo apt -qq update &> /dev/null 

echo " -> installing vim"
sudo apt -qq install vim -y &> /dev/null

echo " -> installing npm"
sudo apt -qq install npm -y &> /dev/null

echo "____Creating vim FS____"
echo " -> creating .vim_temp folder in $HOME"
mkdir ~/.vim_temp

echo " -> moving files to .vim_temp folder"
cp ./plugins.vim ~/.vim_temp/
cp ./plugin-config.vim ~/.vim_temp/

echo " -> moving all files to .vim folder"
rm -rf ~/.vim
mv -f ~/.vim_temp ~/.vim

echo " -> creating .vimrc"
sudo rm -f ~/.vimrc
\cp -r ./.vimrc ~/.vimrc

echo "___Setting up plugins___"
echo " -> installing plugged"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &> /dev/null

echo " -> installing plugins"
vim --not-a-term -u ./.l_vimrc +PlugInstall -c qa &> /dev/null
vim --not-a-term -u ./.l_vimrc +"CocInstall coc-tsserver" -c qa &> /dev/null
