#!/bin/bash

SCRIPTDIR=/home/quagadmin/courses/asmss2022/bash
DIRTOFETCH=ex/asm_ex11
# DIRTOFETCH=sol/asm_ex06
TESTSTUDENT=/home/quagadmin/courses/asmss2022/students/test_student_usernames_asmss2022.txt
STUDENTUSER=/home/quagadmin/courses/asmss2022/students/student_usernames_asmss2022.txt
#' fetch individual directory
#' change to progdir
cd $SCRIPTDIR

#' fetch for test student
cat $TESTSTUDENT | while read s
do
  echo " * Student: $s"
  ./fetch.sh -s $s -d $DIRTOFETCH
  sleep 2
done

#' fetch for real students
cat $STUDENTUSER | while read s
do
  echo " * Student: $s"
  ./fetch.sh -s $s -d $DIRTOFETCH
  sleep 2
done

# check content
cat $STUDENTUSER | while read s
do
  echo " * Student: $s"
  ls -l /home/quagadmin/courses/asmss2022/home/$s/asmss2022/$DIRTOFETCH
  sleep 2
done

# add safe directory
cat $TESTSTUDENT | while read s
do
  echo " * Student: $s"
  sudo git config --global --add safe.directory /home/quagadmin/courses/asmss2022/home/$s/asmss2022
done

cat $STUDENTUSER | while read s
do
  echo " * Student: $s"
  sudo git config --global --add safe.directory /home/quagadmin/courses/asmss2022/home/$s/asmss2022
done
