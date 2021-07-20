bind \cF accept-autosuggestion

set fish_greeting ""
set fish_color_valid_path --bold

### BEGIN ALIAS ###
if status --is-interactive
    set -g fish_user_abbreviations
    abbr --add vi "vim"
end

function lss
    command ls -hG $argv
end

function ls
    command ls -lhG $argv
end

alias l="ls"
alias ll="ls"
alias rm="safe-rm"

### END ALIAS ###

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
end

### END HISTORY CMDS ###

### FISH PROMPT ###
function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
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
    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)

        if [ (_git_is_dirty) ]
            set git_info (set_color --bold yellow) '[' $git_branch ']' (set_color normal)
        else
            set git_info (set_color --bold magenta) '[' $git_branch ']' (set_color normal)
        end

        echo -n -s (set_color --bold normal) '>' $git_info (set_color normal)

    end

    # Terminate with a nice prompt char
    echo -e -s (set_color green) '$ ' (set_color normal)

end

# GET RID OF TIMESTAMP
function fish_right_prompt

end


# add to path

#set -U fish_user_paths $fish_user_paths /usr/local/Cellar/llvm/6.0.0/bin
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -x PYTHONSTARTUP ~/.pythonrc
# uncomment if needed
#set -U fish_user_paths $fish_user_paths ~/Core/go/bin
#set -x GOPATH ~/Core/go
#set -x JAVA_HOME (/usr/libexec/java_home)
#set -x VAGRANT_DEFAULT_PROVIDER vmware_fusion
