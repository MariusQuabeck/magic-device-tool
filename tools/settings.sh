#test if settings file for category in $1 exists, create it if not
function init_settings() {

    if [ ! -e "$MDT_SETTINGS/$1.settings" ]; then
        mkdir "$MDT_SETTINGS"
        touch "$MDT_SETTINGS/$1.settings"
    fi

}

# searches for a certain setting named $2 in the category provided in $1 and returns its value if found
function read_setting() {

    init_settings $1
    grep -w $2 "$MDT_SETTINGS/$1.settings" | cut -d = -f 2
}

# tries to write a setting named$2 with value in $3 to the category provided in $1
function write_setting() {

    init_settings $1
    if [ -n "$(grep -w $2 "$MDT_SETTINGS/$1.settings" | cut -d = -f 2)" ]; then
        sed -ie "s/$2=.*/$2=$3/" "$MDT_SETTINGS/$1.settings"
    else
        echo $2=$3 >> "$MDT_SETTINGS/$1.settings"
    fi
}

# Asks the user a question in $1, and stores the answer in a setting named $3 with the value from console input into category $2
function query_user_setting() {

    echo -n $1
    read value
    write_setting $2 $3 $value
}

#init:globally export the path to the settings folder
export MDT_SETTINGS="$(pwd)/.mdt_settings"


