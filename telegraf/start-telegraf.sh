#!/bin/bash

# define the parameters filename and the configuration filename
input_filename='parameters.conf'
output_filename='linux-monitoring.conf'

# get the information from the parameters file
urls=$(sed '1!d;' $input_filename)
token=$(sed '2!d;' $input_filename)
org=$(sed '3!d;' $input_filename)
bucket=$(sed '4!d;' $input_filename)

# remove previous configurations
sed -i 's/urls = .*/urls = /' $output_filename
sed -i 's/token = .*/token = /' $output_filename
sed -i 's/organization = .*/organization = /' $output_filename
sed -i 's/bucket = .*/bucket = /' $output_filename
# writes to the telegraf configuration file
sed -i "s,urls =,$urls," $output_filename
sed -i "s,token =,$token," $output_filename
sed -i "s,organization =,$org," $output_filename
sed -i "s,bucket =,$bucket," $output_filename

# run telegraf with the configuration file
telegraf --config linux-monitoring.conf