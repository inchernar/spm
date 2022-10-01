#!/bin/bash

#if [[ -d /dev/shm ]]; then
#	TMP_AREA=/dev/shm
#else
#	TMP_AREA=/tmp
#fi


#generate_random_string(){
#	cat /proc/sys/kernel/random/uuid
#}

#create_tmp_file(){
#	touch $1
#	chmod 600 $1
#}

#remove_tmp_file(){
#	rm -f $1
#}


run_pinentry(){
	PINENTRY_SCRIPT="SETPROMPT Please enter your password:\nGETPIN\n"
	pin=$(echo -e $PINENTRY_SCRIPT | pinentry | sed -nr '0,/^D (.+)/s//\1/p') \
		printenv pin
}

# password=$(echo -e "SETPROMPT Please enter your password:\nGETPIN\n" | \
#            pinentry | \
#            sed -nr '0,/^D (.+)/s//\1/p')

get_password(){
	pin1=$(run_pinentry)
	pin2=$(run_pinentry)
	if [ $pin1 = $pin2 ]; then
		pin=$pin1 printenv pin
	else
		exit 1
	fi
}

#save_password_to_file(){
#	password=$1
#	file=$2
#	cat > $file <(password=$password printenv password)
#}

encrypt(){
	password=$(get_password)
	#tmp_file=$TMP_AREA/$(generate_random_string)
	#create_tmp_file $tmp_file
	#save_password_to_file $password $tmp_file
	p=$password printenv p | gpg \
		-c --armor --batch --yes --cipher-algo aes128 \
		--no-symkey-cache \
		--passphrase-fd 0 \
		data.txt
	#remove_tmp_file $tmp_file
}


encrypt
