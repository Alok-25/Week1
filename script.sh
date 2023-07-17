#!/bin/bash

input_file="web_server.log"
error_200=$(grep -c 'HTTP/1.1" 200' "$input_file")
cat <<EOF >>output_file
 "Number of response code 200 : "$error_200"
EOF

declare -A codes

for ((num=100; num<=999; num++)); do
	codes[$num]=$(grep -c "\HTTP/1.1\" $num" "$input_file")
done

for num in "${!codes[@]}"; do
  occur=${codes[$num]}
if [ "$occur" -ne 0 ]; then
cat <<EOF >> output_file
Response code  $num : "$occur"
EOF
 fi

done
