#/bin/sh
#rohjas script

figlet RJ PORT SCAN



echo 1.scan an ip 

echo 2.scan multiple ip

echo 3.scan a single port

echo 4.scan range of ports 

echo 5.scan all ports

echo 6.scan using TCP connect

echo 7.scan using TCP SYN scan

echo 8.scan UDP ports

echo 9.CVE detection

echo 10.detect malware on target host

echo 11.scan OS and service detection

echo 12.IP address information 

echo 13.nmap output format
 
echo select option to scan
read option 

if [ $option = 1 ]
then
echo enter ip to scan:
read ip
nmap $ip



elif [ $option = 2 ]
then
read -p "enter multiple ip:" i_p
for ip in i_p
do nmap $i_p
done

elif [ $option = 3 ]
then 
echo enter ip to scan:
read ip
echo enter port to scan:
read port

nmap -p $port $ip

elif [ $option = 4 ]
then
echo enter ip to scan:
read ip
echo enter range of ports to scan
echo "ENTER RANGE IN THIS FORMAT.  E.G; 1-100"
read range

nmap -p $range $ip


elif [ $option = 5 ]
then
echo enter ip to scan:
read ip

echo SCANNING ALL PORTS ...


nmap -p- $ip

elif [ $option = 6 ]
then 
echo enter ip to scan:
read ip 

nmap -sT $ip

elif [ $option = 7 ]
then 
echo enter ip to scan:
read ip

nmap -sS $ip

elif [ $option = 8 ]
then
echo enter ip to scan:
read ip

nmap -sU $ip


elif [ $option = 9 ]
then 
echo enter ip to scan:
read ip

nmap -Pn --script vuln $ip

elif [ $option = 10 ]
then 
echo enter ip to scan:
read ip
nmap -sV --script=http-malware-host $ip


elif [ $option = 11 ]
then echo enter ip to scan:
read ip
nmap -A -T4 $ip

elif [ $option = 12 ]
then
echo enter ip to scan:
read ip 
nmap --script=asn-query,ip-geolocation-maxmind $ip


elif [ $option = 13 ]
then 
echo enter ip to scan:
read ip
echo enter output filename:
read filename

nmap -oA $filename $ip



else 
echo NOT SUPPORTED
fi

