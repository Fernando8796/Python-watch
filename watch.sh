#!/bin/bash

clear

echo "Qual o nome do arquivo python para assistir? "
read arquivopy

#Pegando a extensão do arquivo
extensao="${arquivopy##*.}"

#Verificando se o arquivo existe e se é um arquivo python
if [ -f "./$arquivopy" ] && [ "$extensao" == "py" ]; then
    
    clear
    echo "Python Watch: Assistindo $arquivopy"
    echo "Ctrl + c para parar"

    python3 $arquivopy
else
    echo "Esse arquivo não existe ou não é um arquivo .py" 
    exit
fi

#Pegando o tamanho inicial
tamanho=$(wc -c < "$arquivopy")

#Loop infinito com intervalo de meio segundo 
while true; do

    tamanhoAtual=$(wc -c < "$arquivopy")

    #Quando houver uma alteração
    if [ "$tamanho" -ne "$tamanhoAtual" ]; then

        clear
        echo "Python Watch: Assistindo $arquivopy"
        echo "Ctrl + c para parar"

        #Atualiza o tamanho
        tamanho="$tamanhoAtual"

        #Executa o arquivo
        python3 $arquivopy

    fi

    sleep 0.5
done
