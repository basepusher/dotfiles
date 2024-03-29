bind \cF accept-autosuggestion


set fish_greeting ""
set fish_color_valid_path --bold

### BEGIN ALIAS ###
if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add vi "vim"
end

#function lss
#    command ls -hG $argv
#end
#
#function ls
#    command ls -lhG $argv
#end
function lss
    command exa  $argv
end

function ls
    command exa -l $argv
end

alias l="ls"
alias ll="ls"
alias diff="colordiff"
alias rm="safe-rm"
alias cat="bat"
alias ncdu="ncdu --color=dark -rr"
alias pip="pip2"


### BEGIN HISTORY CMDS ###
function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
  fzf_key_bindings
end

### END HISTORY CMDS ###

### FISH PROMPT ###
function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end
function _git_head_name
    echo (command git rev-parse --short HEAD 2>/dev/null)
end
function _git_tag_name
    echo (command git tag --points-at HEAD 2>/dev/null)
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function fish_prompt
    # USER & HOST
    if not set -q __fish_prompt_user
        set -g __fish_prompt_user (set_color --bold green)
    end
    if not set -q __fish_prompt_host
        set -g __fish_prompt_host (set_color --bold green)
    end
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    # CWD
    set -l cwd (set_color --bold blue) (pwd | sed "s:^$HOME:~:")

    # Display [venvname] if in a virtualenv
        if set -q VIRTUAL_ENV
        echo -n -s (set_color --bold cyan ) '[' (basename "$VIRTUAL_ENV") ']' (set_color normal) ' '
    end


    # Print pwd or full path
    echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" @ "$__fish_prompt_host" "$__fish_prompt_hostname" (set_color --bold normal) ':' $cwd

    # Show git branch and status
    if [ (command git rev-parse --is-inside-work-tree 2>/dev/null) ]
        if [ (_git_branch_name) ]
            set -U git_branch '[' (_git_branch_name) ']'
        else
            if [ (_git_head_name) ]
                set -U git_branch '[' (_git_head_name)... ']'
            else
                set -U git_branch
            end
        end

        if [ (_git_tag_name) ]
            set -U git_tag '(' (_git_tag_name) ')'
        else
            set -U git_tag
        end


        if [ (_git_is_dirty) ]
            set -U git_info (set_color --bold yellow) $git_branch $git_tag (set_color normal)
        else
            set -U git_info (set_color --bold magenta) $git_branch $git_tag (set_color normal)
        end
        echo -n -s (set_color --bold normal) '>' $git_info (set_color normal)

            
    end

    # Terminate with a nice prompt char
    echo -e -s (set_color green) '$ ' (set_color normal)

end

# GET RID OF TIMESTAMP
function fish_right_prompt

end


# PATH

# Homebrew
set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths

# System SBIN
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# LLVM
#set -x fish_user_paths $fish_user_paths /usr/local/Cellar/llvm/6.0.0/bin


# Ruby
set -g fish_user_paths "/opt/homebrew/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/lib/ruby/gems/3.1.0/bin" $fish_user_paths

#set -g fish_user_paths "/Applications/VMware Fusion.app/Contents/Library" $fish_user_paths 
#set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

#set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion

set -x PYTHONSTARTUP ~/.pythonrc
set -x GOPATH ~/Core/go
set -x GOBIN ~/Core/go/bin
set -x GEM_HOME ~/.gem
set -x EDITOR vim
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

#set -g fish_user_paths "/usr/local/opt/e2fsprogs/sbin" $fish_user_paths

# OpenSSL
#set -x DYLD_LIBRARY_PATH /usr/local/opt/openssl/lib $DYLD_LIBRARY_PATH
# Unicorn
#set -x DYLD_LIBRARY_PATH /usr/local/opt/unicorn/lib $DYLD_LIBRARY_PATH


# Z3
#set -x Z3_LIBRARY_PATH ~/Core/z3/bin
#set -x PYTHONPATH ~/Core/z3/bin/python
#
# Virtualfish
#eval (python3 -m virtualfish)
