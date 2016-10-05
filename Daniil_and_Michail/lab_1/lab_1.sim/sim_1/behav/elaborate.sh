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
ExecStep $xv_path/bin/xelab -wto 3255d831835a43ad8284e164a392acc1 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot new_full_shcheme_tb_behav xil_defaultlib.new_full_shcheme_tb -log elaborate.log
