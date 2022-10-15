#!/bin/bash
usu=$1
#comprueba si no se ha intrducido un parámetro.
if [ -z "$usu" ]
then
	read -p "Introduce el usuario por favor: " usu
fi
if [ -z "$usu" ]
then
	echo "No has introducido un usuario"
	exit 1
fi
cat /etc/passwd | grep "$usu" > /dev/null && existe=0 || existe=1
if [ $existe -eq 1 ]
then
	echo "el usuario $usu no existe"
	exit 1
else
	echo "Información de $usu:"
	echo -n "UID: "
	grep -w $usu /etc/passwd | cut -d: -f3
	echo -n "GID: "
	grep -w $usu /etc/passwd | cut -d: -f4
	echo -n "Home: "
	grep -w $usu /etc/passwd | cut -d: -f6
	echo -n "Shell: "
	grep -w $usu /etc/passwd | cut -d: -f7
fi
