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
	sleep 0.5
done

echo "KLAAR"

#for (( c=1; c<=8; c++ ))
#yolo


#	git init
#	git status
#	untracked files in rood. toevoegen met git add
#	git commit -am"VOER HUER JE TEKST IN"
#	esq :wq
#	git log --al --decorate --graph --oneline
#	in bash rc; alias gitlog=git log --al --decorate --graph --oneline


