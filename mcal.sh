#!/bin/bash
#Modificación al calendario
es_numero='^-?[0-9]+$'
case $# in
   0) anio=$(date +%Y); mes=$(date +%m); cal $mes $anio;; #Asignamos valores actuales y mostramos el calendario del mes y año actual
   1) num_carac=$(echo $1 | wc -c); #Obtenemos el número de caracteres del argumento
      num_carac_real=$(echo "$((num_carac-1))"); #Restamos uno puesto que el ENTER nos lo toma como caracter
      if ! [[ $1 =~ $es_numero ]] && [ $1 = "-help" ] #Si el primer parámetro no es número y es la cadena -help
      then #Imprimimos ayuda
	  echo "**Ayuda del comando mcal**"
          echo "mcal : Proporciona el calendario del mes actual."
          echo "mcal [opcion] : Proporciona el calendario del mes actual o del año especificado." 
          echo "mcal [mes] [año] : Proporciona el calendario del mes y año especificados."
          echo "mcal -help > temp : Proporciona en consola el texto de ayuda."   
      else
	      if [ $num_carac_real -ge 1 ] && [ $num_carac_real -le 2 ] #Si el argumento consta de 1 a 2 caracteres
	      then
		 if [ $1 -ge 1 ] && [ $1 -le 12 ] #Se evalúa si el argumento tiene un valor entre 1 y 12
		 then
		    anio=$(date +%Y); cal $1 $anio #Mostramos calendario del mes (1-12) y el año actual
		 elif [ $1 -ge 13 ] #Si no se evalúa si el argumento es mayor o igual a 13
		 then
		    cal $1 #Mostramos calendario del año introducido
		 fi

	      elif [ $num_carac_real -ge 1 ] && [ $num_carac_real -le 3 ] #Si el argumento consta de 1 a 3 caracteres
	      then
		 
		 if [[ $1 =~ $es_numero ]] #Se evalúa si el argumento es número
		 then
		    cal $1 #Mostramos calendario del año introducido
		 else #Si el argumento no es número
		    anio=$(date +%Y); cal $1 $anio #Mostramos el calendario del mes dado del año actual
		 fi

	      elif [ $num_carac_real -ge 3 ] 
	      then
		cal $1 #Mostramos el calendario del año dado por el usuario
	      
	      fi
       fi;;
   2)
       cal $1 $2;; #Imprimimos calendario con Mes y Año.
   3)
       cat temp #Guardamos en temp la ayuda o la salida estandar del calendario
esac


