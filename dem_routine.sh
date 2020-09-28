#!bin/sh
#freesurfer routine run, $1 = subjNum.nii.gz

source /etc/profile.d/freesurfer.sh

cd $DATA_PATH/Dementia

export SUBJECTS_DIR=$DATA_PATH/Dementia
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# 확장자명 제외 subj 번호만 가져오기.
subj="${1%.nii.gz}"
econ-all -i $1 -s $subj -all

