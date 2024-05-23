@echo off
set xv_path=C:\\.Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xsim moore_sequence_detector_3processes_tb_behav -key {Behavioral:sim_1:Functional:moore_sequence_detector_3processes_tb} -tclbatch moore_sequence_detector_3processes_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
