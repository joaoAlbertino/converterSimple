if [ -e result.txt ]
then 
   rm result.txt
   touch result.txt
fi
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
