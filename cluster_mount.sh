#### Mounting Cluster Instructions ####

##Run this line to mount cluster##

username=catehath ##your username here
nx_number=nx1 ##the server you choose
local_path=Desktop/CNL/neurocluster ##where you want to mount the data

sshfs ${username}@${nx_number}.neuro.berkeley.edu:/home/weiner ./${local_path}

##Run this line to unmount cluster at end of session##

# Umount -f ~/${local_path}