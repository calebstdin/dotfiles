function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx fish_prompt_pwd_dir_length 0 # disable pwd shortening

    # Line 1
    set -l code (__fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) (set_color $fish_color_status) $last_pipestatus)
    if test -n "$code" 
        echo
        echo -n $code
    end

    # Line 2
    echo
    
    set_color $fish_color_cwd
    echo -n (prompt_pwd) 
    set_color normal

    set -lx __fish_git_prompt_showdirtystate true
    set -lx __fish_git_prompt_showuntrackedfiles true
    set -lx __fish_git_prompt_showcolorhints true
    set -lx __fish_git_prompt_color yellow
    set -lx __fish_git_prompt_color_branch yellow
    set -lx __fish_git_prompt_color_flags red
    echo -n (fish_vcs_prompt)

    # Line 3
    echo
    echo "\$ "
end
