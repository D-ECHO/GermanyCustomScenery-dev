#!/bin/sh

build_airport() {
	echo $1;
	echo $2;
	case $1 in
		XEDFG) 	slope=0.5;
			perimeter=5.0;;
		*)	slope=0.025;
			perimeter=5.0;;
	esac
	genapts850 --threads --input=data/airports/$2/$1.dat --work=./work-final --dem-path=SRTM-1 --max-slope=$slope --perimeter=$perimeter
	
}

if [ $1 = "big" ]
then
	for i in data/airports/big_airports/*.dat; do build_airport `echo $i | cut -c 28-31` `echo $i | cut -c 15-26`; done
else
	for i in data/airports/region$1/*.dat; do build_airport `echo $i | cut -c 24-99 |  cut -d . -f 1` `echo $i | cut -c 15-22`; done
fi
