#!/usr/bin/env bash

read -p "Inserici il Numero: " num
gtin=0;
for ((i = ${#num} -1; i >= 0; i--)); do
    elemento=${num:i:1}
    echo "posizione $i: $elemento"
    if ((i % 2 == 0)); then
        gtin=$((gtin + $elemento * 1))
        echo "$elemento * 1"
        echo "gtin: $gtin"
        echo "-------------------------------"
    
    elif ((i % 2 != 0)); then
        gtin=$((gtin + $elemento * 3))
        echo "$elemento * 3"
        echo "gtin: $gtin"
        echo "-------------------------------"
    fi

    posizione=${gtin:1:1}
    x=$(( 10 - posizione ))
    
    y=$((gtin + x))

   result=$((y - gtin))
done


echo "Risultato: $num$result"