#!/bin/bash

show_help() {
    echo "Usage: $0 [options] search_string filename"
    echo "Options:"
    echo "  -n    Show line numbers"
    echo "  -v    Invert match (print lines that do NOT match)"
    echo "  -c    Count matching lines (suppress output, only print count)"
    echo "  --help    Show this help message"
    exit 0
}

if [[ "$1" == "--help" ]]; then
    show_help
fi

show_line_numbers=false
invert_match=false
count_mode=false

while getopts ":nvc" opt; do
  case $opt in
    n)
      show_line_numbers=true
      ;;
    v)
      invert_match=true
      ;;
    c)
      count_mode=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_help
      ;;
  esac
done

shift $((OPTIND -1))  # shift parsed options

if [[ $# -lt 2 ]]; then
    echo "Error: Missing search string or filename."
    show_help
fi

search="$1"
file="$2"

if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' not found."
    exit 1
fi

grep_options="-i"
if [[ "$invert_match" == true ]]; then
    grep_options="$grep_options -v"
fi

line_number=0
count=0

while IFS= read -r line; do
    ((line_number++))
    echo "$line" | grep $grep_options -q -- "$search"
    match=$?

    if [[ $match -eq 0 ]]; then
        if [[ "$count_mode" == true ]]; then
            ((count++))
        else
            if [[ "$show_line_numbers" == true ]]; then
                echo "${line_number}:$line"
            else
                echo "$line"
            fi
        fi
    fi
done < "$file"

if [[ "$count_mode" == true ]]; then
    echo "$count"
fi
