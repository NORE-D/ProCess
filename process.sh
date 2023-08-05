#!/bin/bash
function mostrar_puertos_ejecucion() {
    echo "Puertos en ejecución:"
    netstat -tuln | grep 'LISTEN'
    echo""
}
function mostrar_conexiones_activas() {
    echo "Conexiones activas:"
    netstat -tan | grep 'ESTABLISHED'
    echo ""
}
function main() {
    echo "Auditoría de Puertos en Ejecución"
    mostrar_puertos_ejecucion
    mostrar_conexiones_activas
}
function logo(){
	figlet ProCess
	echo "starting....."
	sleep 6
	clear
}
actualizacion_cada=10  # Tiempo en segundos para la actualización
contador=0
clear
logo
while true; do
    clear
    main
    segundos_faltantes=$((actualizacion_cada - contador))
    echo "Próxima actualización en $segundos_faltantes segundos."
    sleep 1
    contador=$((contador + 1))
    if [ $contador -ge $actualizacion_cada ]; then
        contador=0
    fi
done
