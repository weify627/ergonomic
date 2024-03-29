" FILENAME: vimrc

autocmd!
set nocompatible
filetype off

" VUNDLE PLUGIN
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/YouCompleteMe
set runtimepath-=~/.vim/bundle/vim-autoformat
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

imap <C-L> <Esc>
imap jj <Esc>
" Line numbers only in lower right corner
set ruler
set number
" Highlight lines with more than 80 characters
match Error /\%81v.\+/

" disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" map
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

command SUDOW w !sudo tee > /dev/null %

" colorscheme elv1s

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
" Encoding
" set fileencodings=utf-8,cp1251

" map control-backspace to delete the previous word
" imap <C-BS> <Esc>vBc
map <BS> hx

"Edit mapping (make cursor keys work like in Windows: <C-Left><C-Right>
"Move to next word.
nnoremap <C-Left> b
vnoremap <C-S-Left> b
nnoremap <C-S-Left> gh<C-O>b
inoremap <C-S-Left> <C-O>gh<C-O>b
nnoremap <C-Right> w
vnoremap <C-S-Right> w
nnoremap <C-S-Right> gh<C-O>w
inoremap <C-S-Right> <C-O>gh<C-O>w

nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

" CTRL-S save file
nmap <C-s> :w<CR>
imap <C-s> <C-o><C-s>

" Enable plugins
filetype plugin on

" `XTerm', `RXVT', `Gnome Terminal', and `Konsole' all claim to be "xterm";
" `KVT' claims to be "xterm-color":
if &term =~ 'xterm'
    set hls is
endif

" Cyrillic
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >


" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
    syntax on
endif

" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline


" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" Tabs width = 4
set shiftwidth=4
"set shiftround
set expandtab "Use tabs instead spaces!
set tabstop=4
set autoindent
set smartindent


" Python
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::


" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
    autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
    autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8


" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault


" * Spelling

" define `Ispell' language and personal dictionary, used in several places
" below:
let IspellLang = 'british'
let PersonalDict = '~/.ispell_' . IspellLang

" try to avoid misspelling words in the first place -- have the insert mode
" <Ctrl>+N/<Ctrl>+P keys perform completion on partially-typed words by
" checking the Linux word list and the personal `Ispell' dictionary; sort out
" case sensibly (so that words at starts of sentences can still be completed
" with words that are in the dictionary all in lower case):
execute 'set dictionary+=' . PersonalDict
set dictionary+=/usr/dict/words
set complete=.,w,k
set infercase

" correct my common typos without me even noticing them:
" abbreviate teh the
" abbreviate spolier spoiler
" abbreviate Comny Conmy
" abbreviate atmoic atomic

" Spell checking operations are defined next.  They are all set to normal mode
" keystrokes beginning \s but function keys are also mapped to the most common
" ones.  The functions referred to are defined at the end of this .vimrc.

" \si ("spelling interactive") saves the current file then spell checks it
" interactively through `Ispell' and reloads the corrected version:
" execute 'nnoremap \si :w<CR>:!ispell -x -d ' . IspellLang . ' %<CR>:e<CR><CR>'

" \sl ("spelling list") lists all spelling mistakes in the current buffer,
" but excludes any in news/mail headers or in ("> ") quoted text:
" execute 'nnoremap \sl :w ! grep -v "^>" <Bar> grep -E -v "^[[:alpha:]-]+: " ' .
"  \ '<Bar> ispell -l -d ' . IspellLang . ' <Bar> sort <Bar> uniq<CR>'

" \sh ("spelling highlight") highlights (in red) all misspelt words in the
" current buffer, and also excluding the possessive forms of any valid words
" (EG "Lizzy's" won't be highlighted if "Lizzy" is in the dictionary); with
" mail and news messages it ignores headers and quoted text; for HTML it
" ignores tags and only checks words that will appear, and turns off other
" syntax highlighting to make the errors more apparent [function at end of
" file]:
" nnoremap \sh :call HighlightSpellingErrors()<CR><CR>
" nmap <F9> \sh

" \sc ("spelling clear") clears all highlighted misspellings; for HTML it
" restores regular syntax highlighting:
" nnoremap \sc :if &ft == 'html' <Bar> sy on <Bar>
"  \ else <Bar> :sy clear SpellError <Bar> endif<CR>
" nmap <F10> \sc

" \sa ("spelling add") adds the word at the cursor position to the personal
" dictionary (but for possessives adds the base word, so that when the cursor
" is on "Ceri's" only "Ceri" gets added to the dictionary), and stops
" highlighting that word as an error (if appropriate) [function at end of
" file]:
" nnoremap \sa :call AddWordToDictionary()<CR><CR>
" nmap <F8> \sa


" * Keystrokes -- Moving Around

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
noremap <Space> <C-D>
noremap <S-Space> <C-U>
noremap <BS> <PageUp>
noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" scroll the window (but leaving the cursor in the same place) by a couple of
" lines up/down with <Ins>/<Del> (like in `Lynx'):
" noremap <Ins> 2<C-Y>
" noremap <Del> 2<C-E>
" [<Ins> by default is like i, and <Del> like x.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
" nnoremap <F6> <C-W>w
" nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
" nnoremap <C-N> :next<CR>
" nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>


" * Keystrokes -- Formatting

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


" * Keystrokes -- Toggles

" Keystrokes to toggle options are defined here.  They are all set to normal
" mode keystrokes beginning \t but some function keys (which won't work in all
" terminals) are also mapped.

" have \tp ("toggle paste") toggle paste on/off and report the change, and
" where possible also have <F4> do this both in normal and insert mode:
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
set pastetoggle=<F4>

" have \tf ("toggle format") toggle the automatic insertion of line breaks
" during typing and report the change:
nnoremap \tf :if &fo =~ 't' <Bar> set fo-=t <Bar> else <Bar> set fo+=t <Bar>
            \ endif <Bar> set fo?<CR>
nmap <F3> \tf
imap <F3> <C-O>\tf

" have \tl ("toggle list") toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
nmap <F2> \tl

" have \th ("toggle highlight") toggle highlighting of search matches, and
" report the change:
nnoremap \th :set invhls hls?<CR>


let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'ocaml' : ['.'],
            \ }

let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '<path/to/your/ycm_extra_conf'

set completeopt-=preview

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:ycm_extra_conf_globlist = ['~/*']


" ctrl-p
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
            \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
            \}


let mapleader=","

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree
let g:NERDTreeHijackNetrw=0
let g:nerdtree_tabs_open_on_gui_startup=0


" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer
"
"  " Move to the next buffer
nmap <leader>l :bnext<CR>
"
"  " Move to the previous buffer
nmap <leader>h :bprevious<CR>
"
"  " Close the current buffer and move to the previous one
"  " This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
"
"  " Show all open buffers and their status
nmap <leader>bl :ls<CR>

" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
" set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

" abbreviations:
iabbrev lfpg Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
iabbrev hse he/she
iabbrev sm Smylers


" * Keystrokes -- For HTML Files

" Some automatic HTML tag insertion operations are defined next.  They are
" allset to normal mode keystrokes beginning \h.  Insert mode function keys are
" also defined, for terminals where they work.  The functions referred to are
" defined at the end of this .vimrc.

" \hc ("HTML close") inserts the tag needed to close the current HTML construct
" [function at end of file]:
nnoremap \hc :call InsertCloseTag()<CR>
imap <F8> <Space><BS><Esc>\hca

" \hp ("HTML previous") copies the previous (non-closing) HTML tag in full,
" including attributes; repeating this straight away removes that tag and
" copies the one before it [function at end of file]:
nnoremap \hp :call RepeatTag(0)<CR>
imap <F9> <Space><BS><Esc>\hpa
" \hn ("HTML next") does the same thing, but copies the next tag; so \hp and
" \hn can be used to cycle backwards and forwards through the tags in the file
" (like <Ctrl>+P and <Ctrl>+N do for insert mode completion):
nnoremap \hn :call RepeatTag(1)<CR>
imap <F10> <Space><BS><Esc>\hna

" there are other key mappings that it's useful to have for typing HTML
" character codes, but that are definitely not wanted in other files (unlike
" the above, which won't do any harm), so only map these when entering an HTML
" file and unmap them on leaving it:
autocmd BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
function! MapHTMLKeys(...)
    " sets up various insert mode key mappings suitable for typing HTML, and
    " automatically removes them when switching to a non-HTML buffer

    " if no parameter, or a non-zero parameter, set up the mappings:
    if a:0 == 0 || a:1 != 0

        " require two backslashes to get one:
        inoremap \\ \

        " then use backslash followed by various symbols insert HTML characters:
        inoremap \& &amp;
        inoremap \< &lt;
        inoremap \> &gt;
        inoremap \. &middot;

        " em dash -- have \- always insert an em dash, and also have _ do it if
        " ever typed as a word on its own, but not in the middle of other words:
        inoremap \- &#8212;
        iabbrev _ &#8212;

        " hard space with <Ctrl>+Space, and \<Space> for when that doesn't work:
        inoremap \<Space> &nbsp;
        imap <C-Space> \<Space>

        " have the normal open and close single quote keys producing the character
        " codes that will produce nice curved quotes (and apostophes) on both Unix
        " and Windows:
        inoremap ` &#8216;
        inoremap ' &#8217;
        " then provide the original functionality with preceding backslashes:
        inoremap \` `
        inoremap \' '

        " curved double open and closed quotes (2 and " are the same key for me):
        inoremap \2 &#8220;
        inoremap \" &#8221;

        " when switching to a non-HTML buffer, automatically undo these mappings:
        autocmd! BufLeave * call MapHTMLKeys(0)

        " parameter of zero, so want to unmap everything:
    else
        iunmap \\
        iunmap \&
        iunmap \<
        iunmap \>
        iunmap \-
        iunabbrev _
        iunmap \<Space>
        iunmap <C-Space>
        iunmap `
        iunmap '
        iunmap \`
        iunmap \'
        iunmap \2
        iunmap \"

        " once done, get rid of the autocmd that called this:
        autocmd! BufLeave *

    endif " test for mapping/unmapping

endfunction " MapHTMLKeys()


" * `SLRN' Behaviour

" when using `SLRN' to compose a new news article without a signature, the
" cursor will be at the end of the file, the blank line after the header, so
" duplicate this line ready to start typing on; when composing a new article
" with a signature, `SLRN' includes an appropriate blank line but places the
" cursor on the following one, so move it up one line [if re-editing a
" partially-composed article, `SLRN' places the cursor on the top line, so
" neither of these will apply]:
autocmd VimEnter .article if line('.') == line('$') | yank | put |
            \ elseif line('.') != 1 | -

" when following up articles from people with long names and/or e-mail
" addresses, the `SLRN'-generated attribution line can have over 80 characters,
" which will then cause `SLRN' to complain when trying to post it(!), so if
" editing a followup for the first time, reformat the line (then put the cursor
" back):
autocmd VimEnter .followup if line('.') != 1 | normal gq${j


" * Functions Referred to Above

function! HighlightSpellingErrors()
    " highlights spelling errors in the current window; used for the \sh operation
    " defined above;
    " requires the ispell, sort, and uniq commands to be in the path;
    " requires the global variable IspellLang to be defined above, and to contain
    " the preferred `Ispell' language;
    " for mail/news messages, requires the grep command to be in the path;
    " for HTML documents, saves the file to disk and requires the lynx command to
    " be in the path
    "
    " by Smylers  http://www.stripey.com/vim/
    " (inspired by Krishna Gadepalli and Neil Schemenauer's vimspell.sh)
    "
    " 2000 Jun 1: for `Vim' 5.6

    " for HTML files, remove all current syntax highlighting (so that
    " misspellings show up clearly), and note it's HTML for future reference:
    if &filetype == 'html'
        let HTML = 1
        syntax clear

        " for everything else, simply remove any previously-identified spelling
        " errors (and corrections):
    else
        let HTML = 0
        if hlexists('SpellError')
            syntax clear SpellError
        endif
        if hlexists('Normal')
            syntax clear Normal
        endif
    endif

    " form a command that has the text to be checked piping through standard
    " output; for HTML files this involves saving the current file and processing
    " it with `Lynx'; for everything else, use all the buffer except quoted text
    " and mail/news headers:
    if HTML
        write
        let PipeCmd = '! lynx --dump --nolist % |'
    else
        let PipeCmd = 'write !'
        if &filetype == 'mail'
            let PipeCmd = PipeCmd . ' grep -v "^> " | grep -E -v "^[[:alpha:]-]+:" |'
        endif
    endif

    " execute that command, then generate a unique list of misspelt words and
    " store it in a temporary file:
    let ErrorsFile = tempname()
    execute PipeCmd . ' ispell -l -d '. g:IspellLang .
                \ ' | sort | uniq > ' . ErrorsFile

    " open that list of words in another window:
    execute 'split ' . ErrorsFile

    " for every word in that list ending with "'s", check if the root form
    " without the "'s" is in the dictionary, and if so remove the word from the
    " list:
    global /'s$/ execute 'read ! echo ' . expand('<cword>') .
                \ ' | ispell -l -d ' . g:IspellLang | delete
    " (If the root form is in the dictionary, ispell -l will have no output so
    " nothing will be read in, the cursor will remain in the same place and the
    " :delete will delete the word from the list.  If the root form is not in the
    " dictionary, then ispell -l will output it and it will be read on to a new
    " line; the delete command will then remove that misspelt root form, leaving
    " the original possessive form in the list!)

    " only do anything if there are some misspellings:
    if strlen(getline('.')) > 0

        " if (previously noted as) HTML, replace each non-alphanum char with a
        " regexp that matches either that char or a &...; entity:
        if HTML
            % substitute /\W/\\(&\\|\&\\(#\\d\\{2,4}\\|\w\\{2,8}\\);\\)/e
        endif

        " turn each mistake into a `Vim' command to place it in the SpellError
        " syntax highlighting group:
        % substitute /^/syntax match SpellError !\\</
        % substitute /$/\\>!/
    endif

    " save and close that file (so switch back to the one being checked):
    exit

    " make syntax highlighting case-sensitive, then execute all the match
    " commands that have just been set up in that temporary file, delete it, and
    " highlight all those words in red:
    syntax case match
    execute 'source ' . ErrorsFile
    call delete(ErrorsFile)
    highlight SpellError term=reverse ctermfg=DarkRed guifg=Red

    " with HTML, don't mark any errors in e-mail addresses or URLs, and ignore
    " anything marked in a fix-width font (as being computer code):
    if HTML
        syntax case ignore
        syntax match Normal !\<[[:alnum:]._-]\+@[[:alnum:]._-]\+\.\a\+\>!
        syntax match Normal
                    \ !\<\(ht\|f\)tp://[-[:alnum:].]\+\a\(/[-_.[:alnum:]/#&=,]*\)\=\>!
        syntax region Normal start=!<Pre>! end=!</Pre>!
        syntax region Normal start=!<Code>! end=!</Code>!
        syntax region Normal start=!<Kbd>! end=!</Kbd>!
    endif

endfunction " HighlightSpellingErrors()


function! AddWordToDictionary()
    " adds the word under the cursor to the personal dictonary; used for the \sa
    " operation defined above;
    " requires the global variable PersonalDict to be defined above, and to contain
    " the `Ispell' personal dictionary;
    "
    " by Smylers  http://www.stripey.com/vim/
    "
    " 2000 Apr 30: for `Vim' 5.6

    " get the word under the cursor, including the apostrophe as a word character
    " to allow for words like "won't", but then ignoring any apostrophes at the
    " start or end of the word:
    set iskeyword+='
    let Word = substitute(expand('<cword>'), "^'\\+", '', '')
    let Word = substitute(Word, "'\\+$", '', '')
    set iskeyword-='

    " override any SpellError highlighting that might exist for this word,
    " `highlighting' it as normal text:
    execute 'syntax match Normal #\<' . Word . '\>#'

    " remove any final "'s" so that possessive forms don't end up in the
    " dictionary, then add the word to the dictionary:
    let Word = substitute(Word, "'s$", '', '')
    execute '!echo "' . Word . '" >> ' . g:PersonalDict

endfunction " AddWordToDictionary()


function! InsertCloseTag()
    " inserts the appropriate closing HTML tag; used for the \hc operation defined
    " above;
    " requires ignorecase to be set, or to type HTML tags in exactly the same case
    " that I do;
    " doesn't treat <P> as something that needs closing;
    " clobbers register z and mark z
    "
    " by Smylers  http://www.stripey.com/vim/
    " 2000 May 4

    if &filetype == 'html'

        " list of tags which shouldn't be closed:
        let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '

        " remember current position:
        normal mz

        " loop backwards looking for tags:
        let Found = 0
        while Found == 0
            " find the previous <, then go forwards one character and grab the first
            " character plus the entire word:
            execute "normal ?\<LT>\<CR>l"
            normal "zyl
            let Tag = expand('<cword>')

            " if this is a closing tag, skip back to its matching opening tag:
            if @z == '/'
                execute "normal ?\<LT>" . Tag . "\<CR>"

                " if this is a unary tag, then position the cursor for the next
                " iteration:
            elseif match(UnaryTags, ' ' . Tag . ' ') > 0
                normal h

                " otherwise this is the tag that needs closing:
            else
                let Found = 1

            endif
        endwhile " not yet found match

        " create the closing tag and insert it:
        let @z = '</' . Tag . '>'
        normal `z
        if col('.') == 1
            normal "zP
        else
            normal "zp
        endif

    else " filetype is not HTML
        echohl ErrorMsg
        echo 'The InsertCloseTag() function is only intended to be used in HTML ' .
                    \ 'files.'
        sleep
        echohl None

    endif " check on filetype

endfunction " InsertCloseTag()


function! RepeatTag(Forward)
    " repeats a (non-closing) HTML tag from elsewhere in the document; call
    " repeatedly until the correct tag is inserted (like with insert mode <Ctrl>+P
    " and <Ctrl>+N completion), with Forward determining whether to copy forwards
    " or backwards through the file; used for the \hp and \hn operations defined
    " above;
    " requires preservation of marks i and j;
    " clobbers register z
    "
    " by Smylers  http://www.stripey.com/vim/
    "
    " 2000 May 4: for `Vim' 5.6

    if &filetype == 'html'

        " if the cursor is where this function left it, then continue from there:
        if line('.') == line("'i") && col('.') == col("'i")
            " delete the tag inserted last time:
            if col('.') == strlen(getline('.'))
                normal dF<x
            else
                normal dF<x
                if col('.') != 1
                    normal h
                endif
            endif
            " note the cursor position, then jump to where the deleted tag was found:
            normal mi`j

            " otherwise, just store the cursor position (in mark i):
        else
            normal mi
        endif

        if a:Forward
            let SearchCmd = '/'
        else
            let SearchCmd = '?'
        endif

        " find the next non-closing tag (in the appropriate direction), note where
        " it is (in mark j) in case this function gets called again, then yank it
        " and paste a copy at the original cursor position, and store the final
        " cursor position (in mark i) for use next time round:
        execute "normal " . SearchCmd . "<[^/>].\\{-}>\<CR>mj\"zyf>`i"
        if col('.') == 1
            normal "zP
        else
            normal "zp
        endif
        normal mi

    else " filetype is not HTML
        echohl ErrorMsg
        echo 'The RepeatTag() function is only intended to be used in HTML files.'
        sleep
        echohl None

    endif

endfunction " RepeatTag()

au BufNewFile,BufRead CMakeLists.txt set filetype=cmake
set background=dark
set t_Co=256
"au BufWrite * :Autoformat
"let g:gruvbox_contrast_dark='hard'
"let g:python_highlight_all=1
" colorscheme gruvbox
