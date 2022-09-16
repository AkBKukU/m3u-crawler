#!/bin/bash
start_dir="$(pwd)"
echo "Starting in \"$start_dir\""

header="#EXTM3U"

crawl()
{
	# Recursion Warning
	local item
	for item in *
	do
		if [[ -d "$item" ]]
		then
			echo "$item: Is Dir"
			cd $item
			echo "Making M3U for \"$(pwd)\""
			pl_gen "$item"
			crawl
			cd ..
		fi
		#echo "$item: Done"
	done
}

pl_gen()
{
	name="$1"
	local item
	echo $header > "00-$1.m3u"
	for item in $(find -follow | sed 's|\./||g' | grep -v m3u)
	do
		if [[ ! -d "$item" ]]
		then
			echo "$item" >> "00-$1.m3u"
		fi
	done


}

crawl

