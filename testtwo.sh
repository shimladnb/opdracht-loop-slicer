#! /bin/bash
#
#
# Door Sem Schreuder
#
#


if [ $# -lt 1 ]; then
	echo "geef een bronfile"
	exit
fi

SAMPLE=$(soxi -s $1)
FILENAME=$1
LENGTE=$(echo "scale=0; $SAMPLE/8" | bc)

for c in `seq 1 8`;
do
	START=$(echo "scale=0; $LENGTE*($c-1)" | bc)
	END=$(echo "scale=0; $LENGTE*$c" | bc)
	WOW=`basename $c`

	sox $FILENAME ~/Desktop/output/${WOW}$1 trim =${START}s =${END}s

	echo "start is $START"
	echo "end is $END"
	echo

done

echo "KLAAR"

