@echo off
set xv_path=C:\\.Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 1a7c5a9f5ca14a63b4deed04b544af98 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot mealy_sequence_detector_3processes_tb_behav xil_defaultlib.mealy_sequence_detector_3processes_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
