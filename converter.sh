if [ -e result.txt ]
then 
   rm result.txt
   touch result.txt
fi

echo "Welcome to the converter :)"
read -p "Enter with your option : 1 or 2 :" option

if [ "$option" == 1 ]
then 	
	while read -r line || [[ -n "$line" ]]; do 
		current="$line";	
		if [ ! -z "$current" -a "$current"!=" " ]
		then
		
			coma=",";
			echo "$current$coma";
			echo "$current$coma" >> result.txt
			current="";
		fi

	done < "$1"
else
	read -p "Enter with the column's number please : " numColumn
	read -p "Enter with the delimiter character please :" delimiter

	counter=0;
	while read -r line || [[ -n "$line" ]]; do
                current="$line";
		
		for element in "$current[@]"; do 
                	echo "$element";
			if [ "$element" == "$delimiter" -a "$counter" -lt $numColumn ]
                	then

				counter=$((counter+1))
                	fi
		done
		echo "$counter";
		counter=0

        done < "$1"

fi
