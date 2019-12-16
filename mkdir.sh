#!/usr/bin/env bash

NUMBER=$1

if ! [[ ${NUMBER} =~ ^[0-9]+$ ]]
then
    echo "[ERROR] Not a number"
    exit 0
fi

if [[ ${NUMBER} -lt 100 || ${NUMBER} -gt 9223372036854775807 ]]
then
    echo "[ERROR] range 100-9223372036854775807"
    exit 0
fi

DIR_NUMERALS=0

for COUNT in $(seq $(( ${#NUMBER} - 2 )) -1 1)
do

    NUMERAL=$(( 10 ** (${COUNT} + 1) ))
    NUMERALS[${COUNT}]=$(( ${NUMBER} / ${NUMERAL} % 10 ))

    DIR_NUMERAL=$(( ${NUMERALS[${COUNT}]} * (10 ** (${COUNT} + 1)) ))
    DIR_NUMERALS=$(( ${DIR_NUMERAL} + ${DIR_NUMERALS} ))

    DIR=`printf "%0${#NUMBER}d" ${DIR_NUMERALS}`
    DIRS=${DIRS}${DIR}"/"

done

mkdir -p ${DIRS}
