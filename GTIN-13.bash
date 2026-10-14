#!/usr/bin/env bash

read -p "Inserici il Numero: " num
gtin=0;
for ((i = ${#num} -1; i >= 0; i--)); do
    elemento=${num:i:1}
    echo "posizione $i: / Numero:$elemento"
    if ((i % 2 == 0)); then
        gtin=$((gtin + $elemento * 1))
        echo "Calcoli: $elemento * 1"
        echo "Somma: $gtin"
        echo "________________________________________________________________"
    
    elif ((i % 2 != 0)); then
        gtin=$((gtin + $elemento * 3))
        echo "Calcoli: $elemento * 3"
        echo "Somma: $gtin"
        echo "________________________________________________________________"
    fi

    posizione=${gtin:1:1}
    x=$(( 10 - posizione ))
    
    y=$((gtin + x))
    echo "

   result=$((y - gtin))
   echo "checksum: $result"
done


echo "Risultato: $num$result"