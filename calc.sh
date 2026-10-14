#!/bin/bash

echo " Inserisci un operazione da eseguire: "
read op

case $op in
    "+" |"somma + ")
        echo "Inserisci il primo e secondo  numero: "
        read x y
        result=$((x + y))
        echo "Il risultato di $x + $y è: $result"
        ;;
    "sottrazione" | "-")
        echo "Inserisci il primo e secondo  numero: "
        read x y
        result=$((x - y))
        echo "Il risultato di $x - $y  è: $result"
        ;;
    "moltiplicazione" | "*")
        echo "Inserisci il primo e secondo  numero: "
        read x y
        result=$((x * y))
        echo "Il risultato di $x * $y è: $result"
        ;;
    "divisione" | "/")
        echo "Inserisci il primo e secondo  numero: "
        read x y
        if [ $y -ne 0 ]; 
        then
            result=$((x / y))
            echo "Il risultato di $x / $y è: $result"
        else
            echo "Errore: non divisibile per zero."
        fi
        ;;
    *)
        echo "Operazione non valida. solo somma, sottrazione, moltiplicazione e divisione sono consentite."
        ;;
esac












