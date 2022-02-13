#!/bin/sh

date=`date +"%a_%d_%b_%H:%M_%Y"`
url=http://208.80.54.148/KFWRFMAAC_SC
output_filename=${date}
duration=3600
output_dir=/home/antoine/podcast/server/public/KFWR-FM
cd $output_dir

# Remove old
ls *.aac -t | awk 'NR>15' | xargs rm -f
ls *.cue -t | awk 'NR>15' | xargs rm -f

# -A Don´t create individual tracks
# -a Rip to single file
# -s  Don´t create a directory for each stream

streamripper $url -A -d $output_dir -l $duration -a $output_filename -o always 
