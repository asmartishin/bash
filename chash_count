successes=0
fails=0

for i in $(seq 1 100); do
	timeout 2 foo
	if [ $? -eq 124 ]; then
		(( successes++ ))
	else
		(( fails++ ))
	fi
done

echo $successes
echo $fails
