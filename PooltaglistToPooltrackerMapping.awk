BEGIN {
	FS=" - "
	# i = counter of input lines pooltags
	# j = counter of lines in  
	i=0
	#get size of file (how many lines)
	while (getline input < "00_pooltag.txt") {
		#line[i]=$1
		tempInput = input
		split(tempInput,tempSplit," - ")
		tagInput[i]=tempSplit[1]
		binaryname[i]=tempSplit[2]
		description[i]=tempSplit[3]
		#print binaryname[i]
		i++
	}	
	currentBinaryName = "empty"
	currentDescription = "empty"		
}
	
{
	
	tag = $1
	npAlloc1 = $2
	npAlloc2 = $3
	NPBytes = $4
	pAlloc1 = $5
	pAlloc2 = $6
	pBytes = $7

	for (j=0; j<i; j++) {
		
		if (index(tagInput[j],$1)) {
		currentBinaryName = binaryname[j]
		currentDescription = description[j]
		printf "%-8s \t %15s %6s\t %15s \t %15s %6s \t %15s \t %-30s \t %-30s\n", tag, npAlloc1, npAlloc2, NPBytes, pAlloc1, pAlloc2, pBytes, currentBinaryName, currentDescription 
		break
		}

	}


}
END {
	print "SIZE of i: " i
}