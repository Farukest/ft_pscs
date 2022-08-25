echo '\nSTART...\n'

echo '\nREPO SON VERSIYONA CEKILIYOR...\n'
cd / && mkdir -p home/ft/ && 
cd /home/ft/ && git checkout . && git pull origin master

chmod 700 /home/ft/first.sh
cd /home/ft/ && ./first.sh

i=0
while [ $i -ne 4 ]
do
		i=$(($i+1))
		
		FILE=/home/ft/hs_ft_pf_$i/Makefile
		if [ -e "$FILE" ]; then
			echo "Makefile exist so may compiled c and obj.. check and remove them..\n"
			
			# Check pktfwd exist
			PKTFWD=/home/ft/hs_ft_pf_$i/packet_forwarder/lora_pkt_fwd$i
			if [ -e "$PKTFWD" ]; then
				echo "PKTFWD REMOVED..\n"
				rm -rf /home/ft/hs_ft_pf_$i/packet_forwarder/lora_pkt_fwd$i
			fi 

			# check obj .o exist
			PKTFWDOBJ=/home/hs_ft_pf_$i/packet_forwarder/obj/lora_pkt_fwd$i.o
			if [ -e "$PKTFWDOBJ" ]; then
				echo "PKTFWD .o REMOVED..\n"
				rm -rf /home/hs_ft_pf_$i/packet_forwarder/obj/lora_pkt_fwd$i.o
			fi 
						
			echo "Making new PKTFWD files and the OBJ .o files..\n"
			# Create new pktfwd and the obj .o					
			cd /home/ft/hs_ft_pf_$i/ && make -f Makefile
			echo "Making files success..\n"
			
			
			echo "Maked files moving and keeping and transferring..\n"
			# Move pktfwd to to tmp and then remove folders and again move pktfwd to folder
			mv /home/ft/hs_ft_pf_$i/packet_forwarder/lora_pkt_fwd$i /tmp/
			rm -rf /home/ft/hs_ft_pf_$i
			mkdir -p /home/ft/hs_ft_pf_$i/packet_forwarder/
			mv /tmp/lora_pkt_fwd$i /home/ft/hs_ft_pf_$i/packet_forwarder/  
			echo "Transferring success..\n"
		fi       
		
done

echo '\nJobs adding to cron..\n'
cd /home/ft/ && ./addcron.sh

echo '\nSUCCESS THAT IS ALL..\n'

while true; do sleep 1; done