IFS_BAK=$IFS
IFS=""

for line in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
        full_path="/home/"$USER"/Desktop/subtitle_downloader/"subs-downloader.rb
        ruby $full_path $line 
        notify-send $line
done

IFS=$IFS_BAK