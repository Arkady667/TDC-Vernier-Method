@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto 1e459fb09b6a4c2d8d3afa8b7e4e57bb -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot symulacja_tdc_vo_behav xil_defaultlib.symulacja_tdc_vo -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
