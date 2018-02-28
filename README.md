# Configs

My config files.

After cloning, you need to
1. install vundle 
2. in vim, run :PluginInstall
3. run ```sh setup.sh```

## i3 Window Manager
* Direction key mappings vimified (hjkl) instead of (jkl;)
* Uses my fork of Suckless S2 as terminal https://github.com/paleo9/st

### Key mappings
* Super-F1 gvim
* Super-F2 firefox
* Super-Shift-F2 qutebrowser
* Super-F3 thunderbird

## vimrc
Use ,, to save and jj for <Esc>

Plugin choice is now fairly stable, may add 'fugitive' for git capabilities.
* Vundle.vim
* vdebug
* tagbar
* ack.vim (set up to use Ag the silver searcher)
* undotree
* nerdtree
* vim-signature
* vim-airline
* vim-easymotion
* ultisnips
* ctrlp.vim
* syntastic
* neocomplete.vim
* vim-snippets

n.b. if using a Debian based distro, install vim-nox to provide scripting language support, namely lua and python
