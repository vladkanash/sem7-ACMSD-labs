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
ExecStep $xv_path/bin/xsim full_scheme_tb_behav -key {Behavioral:sim_1:Functional:full_scheme_tb} -tclbatch full_scheme_tb.tcl -view /home/mist/semestr-7/APPMS/sem7-ACMSD-labs/Daniil_and_Michail/lab_2/jk_tb_behav.wcfg -log simulate.log
