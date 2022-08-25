#!/bin/sh
echo 'START...'
chmod 700 /home/ft/first.sh
cd /home/ft/ && ./first.sh

i=0
while [ $i -ne 4 ]
do
		i=$(($i+1))
		
		FILE=/home/ft/hs_ft_pf_$i/Makefile
		if [ -e "$FILE" ]; then
			cd /home/ft/hs_ft_pf_$i/ && make -f Makefile
			mv /home/ft/hs_ft_pf_$i/packet_forwarder/lora_pkt_fwd$i /tmp/
			rm -rf /home/ft/hs_ft_pf_$i
			mkdir -p /home/ft/hs_ft_pf_$i/packet_forwarder/
			mv /tmp/lora_pkt_fwd$i /home/ft/hs_ft_pf_$i/packet_forwarder/
		fi
		
done


cd /home/ft/ && ./addcron.sh

# while true; do sleep 1; done