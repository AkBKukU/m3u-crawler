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
			#echo "$item: Is Dir"
			cd "$item"
			#echo "Making M3U for \"$(pwd)\""
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
	echo "Creating: 00-$1.m3u"
	echo $header > "00-$1.m3u"
	IFS=$'\n'; set -f
	for item in $(find -follow | sed 's|\./||g' | grep -ie "\.flac\|\.mp3\|\.wav\|\.ogg")
	do
		if [[ ! -d "$item" ]]
		then
			echo "$item" >> "00-$1.m3u"
		fi
	done

	# Linux file ordering is dumb, sort files
	sort -o "00-$1.m3u" "00-$1.m3u"

	unset IFS; set +f


}

crawl

