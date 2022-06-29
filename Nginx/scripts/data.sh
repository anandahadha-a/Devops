#!/bin/bash

FILE=data.txt

echo -e "--- Nginx version ---\n" > $FILE
nginx -v &>> $FILE
echo -e "\n--- Nginx compile options ---
           1- OpenSSL
           2- File AIO
           3- Threads support
           4- HTTP v2
           5- select() API
           6- without poll API\n" >> $FILE

echo -e "--- System load Average ---\n" >> $FILE
cat /proc/loadavg >> $FILE
echo -e "\n--- SSL cerifacte for HTTPS ---\n" >> $FILE
openssl x509 -in /etc/nginx/cert.pem -text >> $FILE
echo -e "\n--- System available entropy ---" >> $FILE
cat /proc/sys/kernel/random/entropy_avail >> $FILE
echo -e "\n--- Docker file -----\n" >> $FILE
cat /src/Dockerfile >> $FILE
echo -e "\n--- List of connected devices to the host ---\n" >> $FILE
echo -e "1- Usb:\n " >> $FILE
lsusb >> $FILE
echo -e "2- Pci: \n" >> $FILE
lspci >> $FILE
echo -e "\n ---List of kernel modules ---\n" >> $FILE
lsmod >> $FILE
