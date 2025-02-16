alias discord=vesktop
alias neofetch=fastfetch
alias image_gen="~/ml_env/bin/python ~/workspace/ai/image_gen/flux.py"
alias tlauncher="java -jar /games_library/TLauncher/TLauncher.jar"
alias bat="bat --color=always"
alias ollama_server="ollama serve > /dev/null 2>1 &"
alias rclone="rclone -v --drive-impersonate mdsharique1205@gmail.com"
alias cpbook="zathura ~/workspace/cp/book.pdf"
alias cses="cd ~/workspace/cp/cses/"
alias cf="cd ~/workspace/cp/codeforces/"
alias cc="cd ~/workspace/cp/codechef/"
alias ac="cd ~/workspace/cp/atcoder/"
alias game_res="xrandr -s 1280x1024"
alias norm_res="xrandr -s 1920x1080"
alias bar_text="nvim ~/.config/polybar/config.ini"
alias start_contest="nvim A.cpp B.cpp C.cpp D.cpp"
exec_cpp(){
  g++ -o /tmp/abc  "$1"
  /tmp/abc
}
