i=0
while [ $i -ne 4 ]
do
		i=$(($i+1))
		if pgrep lora_pkt_fwd$i
		then 
			echo "ALREADY RUNNING";
		else
			echo "STARTING BECAUSE IT HAS STOPPED - "pgrep lora_pkt_fwd$i;			
			echo "$i"
			cd /home/ft/hs_ft_pf_$i/ && make -f Makefile
			file=/home/ft/hs_ft_pf_$i/packet_forwarder/lora_pkt_fwd$i
			[ -x $file ] && R="Read = yes" || R="Read = No"
			echo "$R is not executable"
			if ! [ -x $file ]; then
				chmod 700 $file
				echo "$R is now executable..."
			fi
			cd /home/ft/hs_ft_pf_$i/packet_forwarder/ && ./lora_pkt_fwd$i &
			sleep $((20*($i)))
		fi       
		
done
