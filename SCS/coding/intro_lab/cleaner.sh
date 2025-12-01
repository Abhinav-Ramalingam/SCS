#!/usr/bin/env bash

# Create a new empty file to store cleaned IPs
> cleaned-ips.txt

# Read the input file line by line
while IFS= read -r line; do
  # Check if the line contains "has address" (for IPv4)
  if echo "$line" | grep -q "has address"; then
    # Extract the website name and the IPv4 address
    website_name=$(echo "$line" | awk '{print $1}')
    ipv4_address=$(echo "$line" | awk '{print $NF}')
    
    # Write to the cleaned-ips.txt file
    echo "$website_name $ipv4_address" >> cleaned-ips.txt
  fi
done < server-ips.txt

echo "Cleaned IPs saved in cleaned-ips.txt"
