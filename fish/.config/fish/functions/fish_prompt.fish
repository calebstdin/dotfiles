function visual_length --description\
    "Return visual length of string, i.e. without terminal escape sequences"
    # TODO: Use "string replace" builtin in Fish 2.3.0
    [ -z "$argv" ]; and set -l argv ""
    printf $argv | perl -pe 's/\x1b.*?[mGKH]//g' | wc -m
end

function _append --no-scope-shadowing
    set $argv[1] "$$argv[1]""$argv[2]"
end

function print_line
    set -l left_prompt $argv[1]
    set -l right_prompt $argv[2]
    set -l left_length (visual_length $left_prompt)
    set -l right_length (visual_length $right_prompt)
    set -l spaces (math "$COLUMNS - $left_length - $right_length")

    if test -n "$left_prompt"
        echo
    end
    echo -n $left_prompt
    printf "%-"$spaces"s" " "
    echo -n $right_prompt
end


function kubectl_status
  [ -z "$KUBECTL_PROMPT_ICON" ]; and set -l KUBECTL_PROMPT_ICON "⎈"
  [ -z "$KUBECTL_PROMPT_SEPARATOR" ]; and set -l KUBECTL_PROMPT_SEPARATOR "/"
  set -l config $KUBECONFIG
  [ -z "$config" ]; and set -l config "$HOME/.kube/config"
  if [ ! -f $config ]
    echo (set_color red)$KUBECTL_PROMPT_ICON" "(set_color white)"no config"
    return
  end

  set -l ctx (kubectl config current-context 2>/dev/null)
  if [ $status -ne 0 ]
    return
  end

  set -l ns (kubectl config view -o "jsonpath={.contexts[?(@.name==\"$ctx\")].context.namespace}")
  [ -z $ns ]; and set -l ns 'default'

  echo (set_color yellow)"$ctx"(set_color normal)
end

function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx fish_prompt_pwd_dir_length 0 # disable pwd shortening

    # Line 1
    ## Left prompt: k8s context
    ## Right prompt: none
    set -l left_prompt (echo -n (kubectl_status))
    print_line $left_prompt ""

    # Line 2
    ## Left prompt: pwd, git branch
    ## Right prompt: Execution time, error code
    set -l left_prompt (echo -n (set_color $fish_color_cwd)(prompt_pwd)(set_color normal))
    set -lx __fish_git_prompt_showdirtystate true
    set -lx __fish_git_prompt_showuntrackedfiles true
    set -lx __fish_git_prompt_showcolorhints true
    set -lx __fish_git_prompt_color cyan
    set -lx __fish_git_prompt_color_branch cyan
    set -lx __fish_git_prompt_color_flags red
    _append left_prompt (echo (string replace % ! (fish_vcs_prompt)))

    set -l right_prompt ""
    set -l code (__fish_print_pipestatus "[" "]" "|" (set_color $fish_color_status) (set_color $fish_color_status) $last_pipestatus)
    if test -n "$code" 
        _append right_prompt (echo -n $code" ")
    end
    _append right_prompt (echo -n "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
    
    print_line $left_prompt $right_prompt

    # Line 3: Prompt
    echo
    echo "\$ "
end
