# BasIC

### 1. Project Overview
   
This repository is dedicated to the creation of a very simple one-man integrated circuit (IC) as a learning project. 
The main goal is to explore and understand the open-source design flow for IC development using free and publicly available EDA tools and libraries.
Focus is not in the depth, but in width to see the trands.


### 3. Objectives

Gain hands-on experience with open-source tools.
Understand the structure of the open PDKs (e.g., SkyWater SKY130).
Build a foundation for more complex analog or digital IC designs.

### 4. Potential Tools to be checked

      **Schematic (Analog)** — Analog circuit design  
      - 💰 Cadence Virtuoso, Spectre, Synopsys Custom Designer  
      - 💡 Xschem, Ngspice, LTspice, Qucs-S  
      
      **Simulation (Analog)** — SPICE DC/AC/Transient analysis  
      - 💰 Cadence Spectre, Synopsys HSPICE, Keysight ADS  
      - 💡 Ngspice, Xyce, Qucs-S  
      
      **Simulation (Digital)** — HDL simulation & testbenches  
      - 💰 Questasim, VCS, Xcelium  
      - 💡 Icarus Verilog, GHDL, Verilator  
      
      **Mixed-Signal Co-Simulation (AMS)** — Analog + digital simulation  
      - 💰 Cadence AMS Designer, Questa ADMS, CustomSim / Verilog-AMS  
      - 💡 *(no full open-source equivalent)*  
      
      **Functional Verification** — HDL and mixed-signal testing  
      - 💰 UVM, Questasim, Xcelium  
      - 💡 Verilator + cocotb, GHDL + Python  
      
      **Synthesis (Digital → Gate)** — HDL → gate-level conversion  
      - 💰 Synopsys Design Compiler, Cadence Genus, Mentor Precision  
      - 💡 Yosys  
      
      **Place & Route (Digital)** — Automatic logic layout  
      - 💰 Cadence Innovus, Synopsys IC Compiler II, Mentor Nitro  
      - 💡 OpenROAD, TritonRoute, RePlAce  
      
      **Analog Layout** — Manual transistor-level layout  
      - 💰 Virtuoso Layout Suite  
      - 💡 Magic VLSI, KLayout  
      
      **DRC / LVS** — Design rule and schematic consistency checks  
      - 💰 Mentor Calibre, Cadence Assura / PVS, Synopsys ICV  
      - 💡 KLayout DRC/LVS, Netgen, Magic  
      
      **Parasitic Extraction (PEX)** — Extract parasitic R/C  
      - 💰 Cadence QRC, Synopsys StarRC, Mentor Calibre xRC  
      - 💡 Magic extraction, KLayout + Netgen  
      
      **Static Timing (STA)** — Post-synthesis timing checks  
      - 💰 Synopsys PrimeTime, Cadence Tempus  
      - 💡 OpenSTA  
      
      **Power / IR-drop / EM** — Power & current analysis  
      - 💰 Voltus, RedHawk, Totem  
      - 💡 —  
      
      **GDSII Export** — Mask generation for fabrication  
      - 💰 Virtuoso Stream Out, Innovus Stream Out  
      - 💡 Magic, KLayout  
      
      **Tape-out / Foundry Interface** — Preparing for manufacturing  
      - 💰 Internal foundry toolchains  
      - 💡 Efabless Shuttle (SkyWater 130nm)  
      
      **Automation / Scripting** — Process automation and scripting  
      - 💰 SKILL, TCL, proprietary APIs  
      - 💡 Python (PySpice, gdspy, gdstk)  
      
      **PDK** — Process technology library  
      - 💰 Proprietary PDKs (e.g., TSMC, GlobalFoundries)  
      - 💡 SkyWater SKY130, GF180MCU  

### 5. Description

The project demonstrates the complete flow from schematic to layout for a minimal one-men IC with potential of scaling in the future.
It aims to serve as a starting point for students, hobbyists, and researchers interested in open-source silicon design.

### 6. License
This project is open-source and intended for educational and non-commercial use.
Feel free to fork, modify, and learn!
