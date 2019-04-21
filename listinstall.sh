#!/usr/bin/env bash
#----------------------------
# Criado por: Marcos Moreira
#----------------------------

#=====TESTES======
[[ "$UID" -eq "0" ]] || { echo "Execute como root!"; exit 1 ;}
[[ "$1" ]] || { echo "Sintaxe: listinstall.sh <arquivo>"; exit 1 ;}
#=================

#=====FUNÇÕES======
function _INSTALAR_PACOTES(){
    while IFS= read -r pacote; do
	apt-get install "$pacote" 2> /dev/null || echo "[ERRO]: $pacote não instalado!"
    done < "$1"
}
#==================

#=====COMEÇO======
apt-get update -qq > /dev/null || { echo "Não foi possível atualizar o repositório, saindo..."; exit 1 ;}
apt-get upgrade -qq > /dev/null || { echo "Não foi possível atualizar os pacotes, saindo..."; exit 1 ;}
_INSTALAR_PACOTES "$1"
#=================
