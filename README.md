# EE103 | VLSI Design Final Project: 2-bit Unsigned CMOS Magnitude Comparator 
### Made by: Isaac Medina
This project uses CMOS transistor topology to implement the digital logic function of a 2-bit unsigned magnitude comparator. Given 2-bit unsigned numbers A and B (Decimal range: [0, 1, 2, 3]), the CMOS transistor network computes whether A is greater than, equal to, or less than B. There are three output signals: G, E, and L.

A comprehensive written report can be found here. 

NOTE: The "SourcePawn" files are actually SPICE files. GitHub recognizes .sp files as SourcePawn files instead.

The final circuit netlist is in the "Final-Timing-Parameters" folder in the "comparator_timing_v3.sp" file. This circuit was optimized to run at ~500 MHz given the final timing parameters.

## Logic Circuit Diagram
![Logic Circuit Diagram](Schematics/LogicCircuit3VLSIFinalProject.png)

## Synopsys Custom Compiler Schematic
![Synopsys Custom Compiler Schematic](Schematics/SynopsysCustomCompilerCircuit.png)

## Ground Truth VHDL Waveform | GTKWave
![GTKWave Output Waveform](VHDL/GTKWave_output.png)

## Verification of Functionality Waveform | Hspice/Custom Waveview
![Verification of Functionality Waveform](verification_waveform_hspice.png)
