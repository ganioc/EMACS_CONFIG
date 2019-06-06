set nocompatible              " be iMproved, required                           
filetype off                  " required                                        
                                                                                
" set the runtime path to include Vundle and initialize                         
set rtp+=~/.vim/bundle/Vundle.vim                                               
call vundle#begin()                                                             
" alternatively, pass a path where Vundle should install plugins                
"call vundle#begin('~/some/path/here')                                          
                                                                                
" let Vundle manage Vundle, required                                            
Plugin 'VundleVim/Vundle.vim'                                                   
Plugin 'Royal-Colorschemes'                                                     
Plugin 'YouCompleteMe'                                                          
Plugin 'nerdtree'                                                               
Plugin 'vim-taglist'                                                            
" All of your Plugins must be added before the following line                   
call vundle#end()            " required                                         
filetype plugin indent on    " required                                         
                                                                                
                                                                                
" To ignore plugin indent changes, instead use:                                 
"filetype plugin on                                                             
"                                                                               
" Brief help                                                                    
" :PluginList       - lists configured plugins                                  
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache          
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"                                                                               
" see :h vundle for more details or wiki for FAQ                                
" Put your non-Plugin stuff after this line    

set exrc                                                                        
set secure                                                                      
set wrap                                                                        
                                                                                
set number                                                                      
set tabstop=4                                                                   
set softtabstop=4                                                               
set shiftwidth=4                                                                
set noexpandtab                                                                 
set colorcolumn=80                                                              
                                                                                
highlight ColorColumn ctermbg=darkgray                                          
                                                                                
map <F2> :TlistToggle<CR>                                                       
                                                                                
                                                                                
" Taglist                                                                       
let Tlist_Inc_Winwidth=0                                                        
let Tlist_Use_Right_Window = 1                                                  
let Tlist_Sort_Type = "name"                                                    
                                                                                
" You Complete Me                                                               
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"                   
                                                                                
" NERDTree                                                                      
let NERDTreeShowHidden=1                                                        
                              
                              
