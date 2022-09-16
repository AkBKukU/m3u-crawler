# M3U Crawler

I like to listen to music as Albums and Discographies and while my DAP of choice
supports crawling folders for playback it cannot loop a folder. I wanted a tool
to run against an arbitrarily organized directory structure of music files that
can generate an M3U playlist for all files beneath it.


## M3U Format

M3U files are just plain text with a header and file paths specified. The path
can be relative or absolute.

Example (*Fiio X5 Gen 2 absolute paths on SD card 2*):
```
#EXTM3U
TF2:\Music\Koji Kondo\1996 - Super Mario 64\01 - It's a Me, Mario!.flac
TF2:\Music\Koji Kondo\1996 - Super Mario 64\02 - Title Theme.flac
TF2:\Music\Koji Kondo\1996 - Super Mario 64\03 - Peach's Message.flac
```

Metadata may be added to an M3U file with `#EXT*` lines but are not required and
will not be generated by this tool.
