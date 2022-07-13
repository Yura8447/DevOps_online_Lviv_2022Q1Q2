#!/bin/bash
IP=$(awk '{print $1}' apache_logs.txt | sort | uniq -c | sort -nr | head -n 1)
echo "The most requests were from: $IP"

PAGE=$(awk '{print $7}' apache_logs.txt | sort | uniq -c | sort -nr | head -n 1)
echo "The most requested page: $PAGE"

echo "Requests from each IP:"
awk '{print $1}' apache_logs.txt | sort | uniq -c | sort -n

