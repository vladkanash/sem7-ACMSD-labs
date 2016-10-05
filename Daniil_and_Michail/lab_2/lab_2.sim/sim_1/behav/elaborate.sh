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
ExecStep $xv_path/bin/xelab -wto 54d769c12e4e44938f9016dde6585ff2 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot full_scheme_tb_behav xil_defaultlib.full_scheme_tb -log elaborate.log
