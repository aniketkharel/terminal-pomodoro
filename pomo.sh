#!/bin/bash

HELP="
-m,     w for work or b for break
-t,     time in minute
-h,     help me! -> o_o"

dir=$(dirname "$0")/deps
OPTION="${2:-"w"}"
TIME="${4:-45}"

pomodoro () {
    if [ "$OPTION" = "b" ]; then
        LOCAL_OPTION="taking break"
    elif [ "$OPTION" = "w" ]; then 
        LOCAL_OPTION="working" 
    else
        LOCAL_OPTION="just chilling"
    fi
    echo "you are $LOCAL_OPTION for $TIME minute."|"$dir/lolcat"
    "$dir/timer" "${TIME}m"
    echo "$LOCAL_OPTION session completed."|"$dir/lolcat"
    spd-say -t male1 "$LOCAL_OPTION session completed."
}

while [[ $# -gt 0 ]]
do
    case $1 in
        -m|--mode)
            OPTION="$2"
            shift && shift # past argument and value
            ;;
        -t|--time)
            TIME="$2"
            shift && shift # past argument and value
            ;;
        -h|--help|--h)
            echo -e "$HELP"
            exit 0
            ;;
        *)
            echo "Unknown option $1"
            exit 1
            ;;
    esac
done

pomodoro "$@"
