bind \cF accept-autosuggestion

set fish_greeting ""
set fish_color_valid_path --bold

function ls 
    command ls -l -G $argv
end

function ll 
    command ls -l -G $argv
end

### FISH PROMPT ###
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
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
            set git_info $yellow_bold '[' $git_branch "±" ']' (set_color normal)
        else
            set git_info $magenta_bold '[' $git_branch ']' (set_color normal)
        end

        echo -n -s (set_color --bold normal) '>' $git_info (set_color normal)

    end

    # Terminate with a nice prompt char
    echo -e -s (set_color green) '$ ' (set_color normal)

end

# GET RID OF TIMESTAMP
function fish_right_prompt

end
