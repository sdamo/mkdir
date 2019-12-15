#!/usr/bin/env bash

NUMBER=$1
DIR_NUMERALS=0

for COUNT in {6..1}
do

    NUMERAL=$(( 10 ** (${COUNT} + 1) ))
    NUMERALS[${COUNT}]=$(( ${NUMBER} / ${NUMERAL} % 10 ))

    DIR_NUMERAL=$(( ${NUMERALS[${COUNT}]} * (10 ** (${COUNT} + 1)) ))
    DIR_NUMERALS=$(( ${DIR_NUMERAL} + ${DIR_NUMERALS} ))

    DIR_NAME_PATTERN=`printf "%07d" ${DIR_NUMERALS}`
    DIR_NAME=${DIR_NAME}${DIR_NAME_PATTERN}"/"

done

mkdir -p ${DIR_NAME}
