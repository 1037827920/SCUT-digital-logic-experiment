@echo off
set xv_path=C:\\.Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 2b064c0470ba436290ab39ff8fbdd789 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tutorial_tb_behav xil_defaultlib.tutorial_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
