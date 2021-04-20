set PATH /goinfre/okimdil/.brew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/munki /Users/okimdil/.cargo/bin $PATH

starship init fish | source

function norm
    ~/.norminette/norminette.rb $argv
end

alias vim="nvim"
alias python="python3.9"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
