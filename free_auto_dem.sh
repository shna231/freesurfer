#!bin/sh
# create new terminal && run freesurfer (repeat user setting counts)

# 한번에 돌릴 터미널 개수 (일단 5개, CPU 스펙보고 차후 변경)
count=5
i=0

# CPU 사용률 변수: 사용률이 40%를 넘으면 반복문을 쉼.

# 해당 디렉터리 내 파일명 텍스트 파일로 저장.
ls > dem.txt

# '파일명 읽기 > 터미널 실행 > 루틴.sh (파일명)' count번씩 반복 실행
for name in 'cat dem.txt' 
do
    gnome-terminal -- "./dem_routine.sh ${name}"
    
    if[5 -eq $i]; then
      
      
      
      
      i = 0
    fi
    
    i++

done
