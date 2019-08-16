#!/bin/bash
echo "INICIANDO MODO DE MONITORAMENTO WLAN0"

function _erro() {
  echo "Ocorreu o ERRO: $1: $(cat /tmp/erro)"
}

function _verficarerro(){

$1

rtn=$?

if [ $rtn -ne 0 ]

then 

_erro $rtn

else

echo "$2"

fi

}

function _execmonitormode() {

_verficarerro "airmon-ng check kill"  "PROCESSOS MATADOS [OK]"
sleep 10
_verficarerro "ifconfig wlan0 down"  "WLAN0 PARADA [OK]"
sleep 5
_verficarerro "iwconfig wlan0 mode monitor"  "MODO DE MONITORAMENTO SETADO [OK]"
sleep 5
_verficarerro "ifconfig wlan0 up"  "WLAN0 INICIADA [OK]"
sleep 5
_verficarerro "iwconfig wlan0 "  ""

echo "TESTE DA INTERFACE - SCRIPT BY L0od"

}

_execmonitormode 
















