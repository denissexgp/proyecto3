#!/bin/bash
#programa para el examen de primer parcial 
# programa para calcular la distancia y saque el promedio de distancias 
# Los parametros son nombre de archivo, columna de inicio, columna de fin. 

archivo="$1"
col_inicio="$2"
col_fin="$3"

if [ -z "$archivo" ] || [ -z "$col_inicio" ] || [ -z "$col_fin" ]; then
  echo "Uso: $0 archivo col_inicio col_fin"
  exit 1
fi

promedio=$(awk -v ini="$col_inicio" -v fin="$col_fin" '
NR==1 { next }
{
  dist = $fin - $ini
  if (dist < 0) dist = -dist
  suma += dist
  n++
}
END {
   print suma/n}
' "$archivo")

echo "Promedio de distancias: $promedio"
