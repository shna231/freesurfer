#!bin/sh
# create new terminal && run freesurfer (repeat user setting counts)

# 한번에 돌릴 터미널 개수 (일단 5개, CPU 스펙보고 차후 변경)
count=5
i=1

# 해당 디렉터리 내 파일명 텍스트 파일로 저장(missing 데이터 제외).
ls | grep 'missing' -v > dem.txt

# '파일명 읽기 > 터미널 실행 > 루틴.sh (파일명)' count번씩 반복 실행
for name in 'cat dem.txt' 
do
    gnome-terminal -- "./dem_routine.sh ${name}"
    
    # 5번 실행마다 평균 소요시간(6h)만큼 sleep
    if[5 -eq $i]; then
      sleep 6h
      
      # recon-all 프로세스가 존재하는지 10분 단위로 확인
      while: 
      do
        if pgrep -x "recon-all" > /dev/null
        then
            sleep 10m
        else
            break
        fi  
      done
      
      # recon all  프로세스 종료 확인 후 i 초기화 > 터미널 작업 반복
      i=0

    fi
    
    i++

done
