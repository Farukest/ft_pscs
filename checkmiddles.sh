ptCount=$(pgrep -c python3+)

echo $ptCount

if(( $ptCount != 1 ));
	then
		if(( $ptCount != 0 ));
			then
				echo 'olduruldu'
				cd /home/ft/ && ./killmiddles.sh
		fi
		echo 'calistirildi'
		cd /home/ft/ && ./runmiddles.sh
	else
		echo 'nothing to do'
fi