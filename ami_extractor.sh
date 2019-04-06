# get the image id from an output file that is created after packer is executed and store it in a file so that terraform can access it to provision the instance
get_ami_id(){
	awk 'NF{last=$NF} END{print "variable \x22public_ami\x22 { default = \x22" last  "\x22 }" }' ./packer/packer_output.txt > ./terraform/ami_id.tf
}
get_ami_id
