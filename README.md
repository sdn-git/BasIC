# BasIC

1. Project Overview
This repository is dedicated to the creation of a very simple one-man integrated circuit (IC) as a learning project. 
The main goal is to explore and understand the open-source design flow for IC development using free and publicly available EDA tools and libraries.
Focus is not in the depth, but in width to see the trands.


3. Objectives
Gain hands-on experience with open-source tools.
Understand the structure of the open PDKs (e.g., SkyWater SKY130).
Build a foundation for more complex analog or digital IC designs.

4. Potential Tools to be checked
   **Schematic (Analog)**: Analog circuit design
     Commercial: Cadence Virtuoso Schematic Editor, Spectre, Synopsys Custom Designer
     Free:       Ngspice, Xschem, LTspice, Qucs-S
   **Simulation (Analog)**: SPICE DC/AC/Transient simulation
     Commercial: Cadence Spectre, Synopsys HSPICE, Keysight ADS
     Free:       Ngspice, Xyce, Qucs-S
   **Simulation (Digital)**: HDL simulation and testbenches
     Commercial: Questasim, VCS, Incisive/Xcelium
     Free:       Icarus Verilog, GHDL, Verilator
   **Mixed-Signal Co-Simulation (AMS)**: Combined analog + digital simulation
     Commercial: Cadence AMS Designer, Mentor Questa ADMS, Synopsys CustomSim / Verilog-AMS
     Free:       *(no analog)*
   **Functional Verification**: HDL and mixed-signal verification
     Commercial: UVM / Questasim / Xcelium
     Free:       Verilator + cocotb, GHDL + Python
   **Synthesis (Digital → Gate)**: HDL to gate-level conversion
     Commercial: Synopsys Design Compiler, Cadence Genus, Mentor Precision
     Free:       Yosys
   **Place & Route (Digital Backend)**: Automatic logic placement
     Commercial: Cadence Innovus, Synopsys IC Compiler II, Mentor Nitro
     Free:       OpenROAD, TritonRoute, RePlAce
   **Analog Layout**: Manual topological layout
     Сommercial: Virtuoso Layout Suite
     Free:       Magic VLSI, KLayout
   **DRC / LVS**: Design rule and layout verification
     Commercial: Mentor Calibre, Cadence Assura / PVS, Synopsys ICV
     Free:       KLayout DRC/LVS, Netgen, Magic
   **Parasitic Extraction (PEX)**: Extract parasitic R/C
     Commercial: Cadence QRC, Synopsys StarRC, Mentor Calibre xRC
     Free:       Magic extraction, KLayout + Netgen
   **Static Timing Analysis (STA)**: Timing checks after synthesis
     Commercial: Synopsys PrimeTime, Cadence Tempus
     Free:       OpenSTA
   **Power / IR-drop / EM Analysis**: Power and current analysis
     Commercial: Voltus, RedHawk, Totem
     Free:       Not required for small ICs 
   **GDS II Export**: Mask generation for fab
     Commercial: Virtuoso Stream Out, Innovus Stream Out
     Free:       Magic, KLayout
   **Tape-out / Foundry Interface**: Preparing for manufacturing
     Commercial: internal foundry toolkits
     Free:       Efabless Shuttle (SkyWater 130nm)
   **Automation / Scripting**: Automating flow and simulations
     Commercial: Cadence SKILL, TCL, Python APIs
     Free:       Python (PySpice, gdspy, gdstk)
   **PDK**: Technology library
     Commercial: internal libraries (TSMC, for instance)
     Free:       PDK	SkyWater SKY130

5. Description
The project demonstrates the complete flow from schematic to layout for a minimal one-men IC with potential of scaling in the future.
It aims to serve as a starting point for students, hobbyists, and researchers interested in open-source silicon design.

6. License
This project is open-source and intended for educational and non-commercial use.
Feel free to fork, modify, and learn!
