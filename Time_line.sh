# !~/bin/bash 

#########################################################  for timestamp part  ###### ########################################

echo "Tims Stamp collection "

TimeStamp_function()
{
        local test_array;
        local test_num=0;
        for test_file_name in $(find $1)
        do
                test_array[${test_num}]=$test_file_name;
                test_num=$((${test_num}+1))
        done
        for ((i=0  ; i <${test_num} ; i++  ))
        do
                printf   "${test_array[$i]},"  >> $OUTPUT_F/_table.csv 2>1&
		Access_time=$(stat  ${test_array[$i]}  | tail -4 | grep "Access" | awk -F ' ' '{for (i=2; i <= NF; i++) {printf $i", "} }') 
		Modify_time=$(stat  ${test_array[$i]}  | tail -4 | grep "Modify" | awk -F ' ' '{for (i=2; i <= NF; i++) {printf $i", "} }')  
		Change_time=$(stat  ${test_array[$i]}  | tail -4 | grep "Change" | awk -F ' ' '{for (i=2; i <= NF; i++) {printf $i", "} }')
                fs=$(df "${test_array[$i]}"  | tail -1 | awk '{print $1}')
                crtime=$(sudo debugfs -R 'stat '${test_array[$i]}'' "${fs}"  2>/dev/null  | grep -oP  'crtime.*--\s*\K.*'  | awk -F ' ' '  {printf $5"-"$2"-"$3", "$4  "\n" }'     )
		echo $Access_time , $Modify_time , $Change_time ,$crtime >> $OUTPUT_F/_table.csv
        done

        echo   -e " "   >> $OUTPUT_F/_table.csv

        return 0
}


TimeStamp_function_no_birth_time()
{
        local test_array;
        local test_num=0;
        for test_file_name in $(find $1)
        do
                test_array[${test_num}]=$test_file_name;
                test_num=$((${test_num}+1))
        done
        for ((i=0  ; i <${test_num} ; i++  ))
        do
                printf   "${test_array[$i]},"  >> $OUTPUT_F/_table.csv 2>1&
		Access_time=$(stat  ${test_array[$i]}  | tail -4 | grep "Access" | awk -F ' ' '{for (i=2; i <= NF; i++) {printf $i", "} }')
		Modify_time=$(stat  ${test_array[$i]}  | tail -4 | grep "Modify" | awk -F ' ' '{for (i=2; i <= NF; i++) {printf $i", "} }')
		Change_time=$(stat  ${test_array[$i]}  | tail -4 | grep "Change" | awk -F ' ' '{for (i=2; i <= NF; i++) {printf $i", "} printf "\n" }')
		echo    $Access_time ,$Modify_time , $Change_time   >> $OUTPUT_F/_table.csv
        done

        echo   -e  " "   >> $OUTPUT_F/_table.csv

        return 1

}


Time_Function=""
if test  -z `command -v debugfs`
    then
        Time_Function=TimeStamp_function_no_birth_time
        echo "string is null "
    else
        Time_Function=TimeStamp_function
	echo $Time_Function
        echo "string is valid"
fi


echo "usage ./sh absoult target_folder  output_folder "



OUTPUT_F=$2

$Time_Function  $1 
