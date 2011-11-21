REM script to delete the old vimrc link and create another winxp hardlink from ~\_vimrc to ~\.vim\.vimrc 
REM shoul be run from the ~/.vim directory
del ..\.vimrc
fsutil hardlink create ..\.vimrc .\.vimrc
