## set up a new shared project folder ##
import sys
import os
def setup_dir(project_dir):
	"""
	CREATES THE FOLLOWING SUB_DIRS FOR A SHARED PROJECT FOLDER:
	BIDS: nifti files in BIDS format 
	subjects: freesurfer recon-all output
	subject_lists: lists of subjects included in your analysis
	demogr_data: demographic/behavioral data
	projects: a parent directory for any projects using this data
	_____________
	Requirements: Julie (support-cirl@berkeley.edu ) to have created a shared folder in /hoome/weiner
	_____________
	Usage:
	RUN FROM COMMAND LINE: $ python dir_str.py '<shared project dir>'
	"""
	dirNames = ['BIDS', 'subjects', 'subject_lists', 'demogr_data', 'projects']
	root_dir = project_dir

	# create target directory if it doesn't exist.
	for dirName in dirNames:

		if not os.path.exists(os.path.join(root_dir, dirName)):
			os.mkdir(os.path.join(root_dir,dirName))
			print("Directory", dirName, "Created")
		else: 
			print('Directory', dirName, "already exists")

	# set up a README file
	if not os.path.exists(os.path.join(root_dir, "README.txt")):
		print("Let's get some info for the README.txt file. Please add more info as you go")
		datasetName = input("Enter name of the dataset: ")
		subset = input(" If you downloaded a subset of the data, describe here (eg. 'ADNI_N30_baseline.' else, NA): ")
		origin = input("url or origin of dataset: ")

	# create a README
	
		rm = os.path.join(root_dir, "README.txt")
		readme = open(rm, 'w')
		readme.write(datasetName + " downloaded from " + origin + "\nIf a subset of the data was downloaded list here:" + subset)
		readme.close()
	else: 
		print("README already exists")

if __name__=='__main__':
	setup_dir(sys.argv[1])
