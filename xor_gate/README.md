***HOW  TO  RUN***

1.  Have Questasim  Installed.
2.  Install VScode
3.  (Optional)  Install the UVM Extension for VScode.
4.  Close VScode.
5.  Press 'Win + r'
6.  Type in 'wt'
7.  If nothing found then open microsoft store and install 'windows terminal' (Terminal is missing hence need to install)
8.  When windows terminal has opened, navigate to the directory where you want to have your project in the terminal. : cd .\Documents\UVM\... as per your requirement
9.  when you reached the folder, create a new folder and give it your project name :  make new folder using mkdir <project_name>
10.  Go inside this project folder from the terminal using the cd command :    cd <project_name>
11.  This is where all your project files will be created and saved.
12.  now type in the terminal :   code .      (this will open vscode from that following directory)
13.  This will make the vscode's terminal open in that directory
14.  Once vscode is open, press  ctrl + `  to open the terminal in vscode platform.
15.  The VSCode terminal will be open and henceforth we will be using this vscode terminal, you may close the windows terminal in the background.
16.  Now all the commands from here are supposed to be typed in the VScode terminal
17.  Type in terminal  vlib  <name_you_want_to_give_to_your_work_library>      (this is necessary, recommended to give the name of your project i.e. <xor_gate_lib>)
18.  This will make the work library alias as and_gate_lib  as per questa's requirements.
19.  now if you have the design and sim files just copy it from the windows gui into this project folder (not the library folder, just outside it)
20.  If you want to create a new file type  :    code  <file_name.sv>
21.  The file will be created , save it and type in it if required.
22.  To compile a file  :    vlog -lint -sv -work <project_lib> <file_name.sv>  (this will compile the file_name.sv  file)
23.  For example  :    vlog -lint -sv -work xor_gate_lib  xor_gate.sv
24.  If you want to compile multiple files then just add the file names in the end
25.  Note  :  the '-lint' is optional but is highly recommended
26.  To run a file :   vsim -c -voptargs=+acc <project_lib>.top_file_name
27.  For example  :    vsim -c -voptargs=+acc xor_gate_lib.xor_gate_tb
28.  The '-c' part is there to run/open questa on your vscode terminal, if the '-c' is not mentioned then a questa window will be opened
29.  The '-voptargs=+acc' is there to disable optimization because optimizing might remove some signals thinking they are not necessary.
30.  Now once the questa terminal is there, type :    add wave *    (to add all the signals in the simulation window, if you don't want that then you may skip this step)
31.  Now to run the simulation type  :    run -all
32.  To switch to the wave window using cli  :  show wave
33.  To quit the simulation window  :  quit -sim
34.  To quit questa  :  quit -f    or (ctrl + c if you've opened questa in vscode terminal)
35.  You may also use the 'impulse' extension in vscode to directly see the waveform by clicking on the waveform.vcd file created by the testbench.
