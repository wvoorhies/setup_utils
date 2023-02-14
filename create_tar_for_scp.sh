
## This script compresses desired .label and surf file into tar file for download to local machine 

## use scp to download tar file to local machine and then upload to relevant sharing platform

SUBJECTS_DIR=##ENTER SUBJECT DIR
LABELS=##ENTER LABEL DIR
SUBJECTS=$(cat ##ENTER .TXT SUBJECT LIST)
PROJECT_NAME=##ENTER PROJECT ID


## Create transfer directory if one does not exist
if [ ! -d TransferNoBackup ]; then
    mkdir TransferNoBackup
fi


## Loop through subject, label, and surface type; append filenames to txt for tar compression
## NOTE: if this is run multiple times on the same filename, it will append to that filename. If changes must be made, be sure to delete .txt to allow for accurate label and surf list.

for sub in ${SUBJECTS}; do
    for label in ${LABELS}; do
	
        label_file='${SUBJECTS_DIR}/${sub}/label/?h.${label}.label'
	
	if [ -e ${label_file} ]; then
	    ls -1d ${label_file} >> ~/TransferNoBackup/${PROJECT_NAME}_labels.txt
	fi
	
	   
    done
    ## Update with other surface types 
    ## COMMENT OUT FOR LOOP (LINES 34 - 38) if you require all surfaces
    for surf_type in pial inflated; do
	surf_file="${SUBJECTS_DIR}/${sub}/surf/?h.${surf_type}"
	
	ls -1d ${surf_file} >> ~/TransferNoBackup/${PROJECT_NAME}_surf.txt
    done
    
    #UNCOMMENT THE FOLLOWING LINE IF ALL SURFACES ARE DESIRED
	# ls -1d ${SUBJECTS_DIR}/${sub}/surf/*
done


cd ${SUBJECTS_DIR}
tar -cvf ~/TransferNoBackup/${PROJECT_NAME}_labels.tar -T ~/TransferNoBackup/${PROJECT_NAME}_labels.txt

tar -cvf ~/TransferNoBackup/${PROJECT_NAME}_surf.tar -T ~/TransferNoBackup/${PROJECT_NAME}_surf.txt



