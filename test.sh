first="carrot"
second="banana"

if [[ "$first" > "$second" ]]
then 
	echo "$first comes before $second alphabetically"
else
	echo "$second comes after $first alphabetically"
fi
