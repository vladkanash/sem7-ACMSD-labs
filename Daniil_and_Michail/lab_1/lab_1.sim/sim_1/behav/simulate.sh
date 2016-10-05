#!/bin/sh -f
xv_path="/home/mist/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim new_full_shcheme_tb_behav -key {Behavioral:sim_1:Functional:new_full_shcheme_tb} -tclbatch new_full_shcheme_tb.tcl -view /home/mist/semestr-7/APPMS/sem7-ACMSD-labs/Daniil_and_Michail/lab_1/new_full_shcheme_tb_behav.wcfg -log simulate.log
