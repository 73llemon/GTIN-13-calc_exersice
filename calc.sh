#!/bin/bash
stringa=$1;
cifre=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0");
operatori=("+" "-" "x" "/");
all_char=("${cifre[*]} ${operatori[*]}");
count_op=0;
error_string="Inserisci solo numeri e il simbolo dell'operazione (singola) che vuoi eseguire es. '13*3' ";
set operator;
for ((i=0; i<${#stringa}; i++)); do
    
    if [[ " ${all_char[*]} " != *" ${stringa:i:1} "* ]]; then
        echo $error_string;
        exit 1;
    fi
    
    if [[ " ${operatori[*]} " == *" ${stringa:i:1} "* ]]; then
        ((count_op++));
        operator=${stringa:i:1};
        if [ $count_op -gt 1 ]; then
            echo $error_string;
            exit 1;
        fi
    fi
done
if [[ $count_op -eq 1 ]]; then
    IFS=${operator} read -r arg1 arg2 <<< $stringa
        case ${operator} in
            "+")
                # Esegue l'addizione se il carattere dell'operazione è "+"
                echo $(( arg1 + arg2 ));
                exit 0;
                ;;
            "-")
                # Esegue la sottrazione se il carattere dell'operazione è "-"
                echo $(( arg1 - arg2 ));
                exit 0;
                ;;
            "x")
                # Esegue la moltiplicazione se il carattere dell'operazione è "x"
                echo $(( arg1 * arg2 ));
                exit 0;
                ;;
            "/")
                # Esegue la divisione se il carattere dell'operazione è "/"
                if [[ $arg2 -eq 0 ]]; then
                    echo "non puoi dividere per 0, riprova!"
                    exit 1;
                else
                    echo $(( arg1 / arg2 ));
                    exit 0;
                fi
                ;;
            *)
                # Esegue il controllo dei valori e stampa errore se il carattere dell'orepazione non è uno dei seguenti + - x /
                echo $error_string;
                exit 1;
                ;;
        esac
fi