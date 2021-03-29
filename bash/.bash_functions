# never memorize syntax again
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)  echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
function buildtime {
    dnf --quiet repoquery --queryformat '%{name}-%{evr}.%{arch} %{buildtime}' $1
}

# get an ordered list of subdirectory sizes
function subdir_sizes {
    du -sk ./* | sort -n | awk 'BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }'
}


# go up args # of dirs
function up() {
    local arg=${1:-1};
    local dir=""
    while [ $arg -gt 0 ]; do
        dir="../$dir"
        arg=$(($arg - 1));
    done
    cd $dir #>&/dev/null
}

# compute the total of specified column
function total() {
    if [ x$1 = x ]; then
        set `echo 1`
    fi
    awk "{total += \$$1} END {print total}"
}

# restore terminal after messing up console
function restaura() {
    perl -e 'print "\e)B";'
}

# make a new directory and then change to it
function mkcd() {
    mkdir -p "$1" && cd "$1" # $@ --> $1
}

# give /simple/ arguments to bc
function calc() {
    bc -l <<< "$@"
}

# look up a page on Wikipedia via DNS
function wiki() {
    dig +short txt $1.wp.dg.cx;
}

# Base Conversions #
function dec_2_hex() { 
    echo 'obase=16;'$1 | bc
}
function dec_2_bin() { 
    echo 'obase=2;'$1 | bc
}
function bin_2_dec() { 
    echo 'ibase=2;obase=A;'$1 | bc
}
function hex_2_dec() {
    echo 'ibase=16;obase=A;'$1 | bc
}

# colored output
function blue() {
    echo -e "\x1b[34m\x1b[1m"$@"\x1b[0m"
}
function yellow() {
    echo -e "\x1b[33m\x1b[1m"$@"\x1b[0m"
}
function green() {
    echo -e "\x1b[32m\x1b[1m"$@"\x1b[0m"
}
function red() {
    echo -e "\x1b[31m\x1b[1m"$@"\x1b[0m"
}

# check for md5 hash match
function md5check() {
    test `md5sum $2 | cut -d' ' -f1` = "$1" && green [OK] || red [FAIL]
}

# find newer files than $1
function newer() {
    find . -newer $1 -type f
}

# quickly grab stderror meaning
function strerror() {
    python -c "import os; print(os.strerror($1));"
}

# print ascii tree of most intensive processes
function process_tree() {
    watch -n 1 --no-title 'pstree $(ps -eo pid --sort %cpu | tail -n 1)'
}

# get all links from a site
function get_links_from() {
    lynx -dump http://www.$1 | awk '/http/{print $2}'
}
