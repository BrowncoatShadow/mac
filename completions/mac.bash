_mac() {
    local MACWORDS cur prev

    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev

    MACWORDS=$(mac help commands)

    if [[ "${COMP_CWORD}" -eq 1 ]] || [[ "${prev}" == "help" ]]; then
        COMPREPLY=( $( compgen -W "${MACWORDS}" -- "${cur}" ) )
    fi

    __ltrim_colon_completions "${cur}"
}
complete -o default -o bashdefault -F _mac mac
