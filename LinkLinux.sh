LVIM_DIR=$(pwd)/lvim
ln -s $LVIM_DIR/config.lua ~/.config/lvim/config.lua
ln -s $LVIM_DIR/ftplugin ~/.config/lvim/ftplugin
ln -s $LVIM_DIR/ftdetect ~/.config/lvim/ftdetect
ln -s $LVIM_DIR/lua ~/.config/lvim/lua

ln -s $(pwd)/starship/starship.toml ~/.config/starship.toml
