#! /bin/bash

echo ""

echo "==================================================="

echo "Starting Network Sweeper"

echo "==================================================="


if [ “$1” == “” ]
then
    echo “Type the IP address to scan.”
    echo “Example: ./main.sh 192.168.2”
    echo "==================================================="

else
    ./Sweep.sh $1 > ips.txt



echo ""
echo ""

echo "=============== Active IP Address ================="

cat ips.txt
echo "==================================================="

echo ""
echo ""

echo "============== Network Information ================"

for ip in $(cat ips.txt); do 
    echo "" 
    echo "------------ $ip --------------" 
    
    nslookup $ip | grep "name"
done

echo "==================================================="


echo ""
echo ""

echo "================== PORT SCANS ====================="


for ip in $(cat ips.txt); do 
    echo ""
    echo "------------ $ip --------------" 
    echo ""
    nmap -p- -T5 $ip
done 
echo ""
echo "==================================================="
echo ""
echo "================== Exiting ========================"
fi