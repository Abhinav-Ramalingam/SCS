#!/bin/bash

# Output file for ping results
output_file="ping_results.txt"

# Clear the output file before writing
> $output_file

# Read the cleaned-ips.txt file
while IFS=" " read -r website ip; do
  # Display PINGING <website-name>
  echo "PINGING $website"

  # Run the ping command (1 packet) and capture the output
  ping_output=$(ping -c 1 "$ip")

  # Check if packet loss is 0%
  if echo "$ping_output" | grep -q "0% packet loss"; then
    # If packet loss is 0%, store the result in the output file
    echo "$website $ip - SUCCESS" >> "$output_file"
  else
    # If packet loss is more than 0%, do not store the result
    echo "$website $ip - FAILED" >> "$output_file"
  fi
done < cleaned-ips.txt

# Display a message when done
echo "Ping results stored in $output_file."
