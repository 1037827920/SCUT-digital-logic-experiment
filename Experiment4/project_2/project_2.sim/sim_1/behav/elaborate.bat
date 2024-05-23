@echo off
set xv_path=C:\\.Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 5bcb5080637944a19a3c89bc189b0f4a -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot moore_sequence_detector_3processes_tb_behav xil_defaultlib.moore_sequence_detector_3processes_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
