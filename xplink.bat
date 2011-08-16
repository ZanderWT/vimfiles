REM script to delete the old vimrc link and create another winxp hardlink from Vim\_vimrc to Vim\vimfiles\_vimrc 
REM shoul be run from the vimfiles directory
del ..\_vimrc
fsutil hardlink create ..\_vimrc .\_vimrc
