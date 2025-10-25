# BasIC

1. Project Overview
This repository is dedicated to the creation of a very simple integrated circuit (IC) as a learning project.
The main goal is to explore and understand the open-source design flow for IC development using free and publicly available EDA tools.

2. Objectives
Gain hands-on experience with open-source tools such as Xschem, Ngspice, and Magic VLSI.
Understand the structure of the open PDKs (e.g., SkyWater SKY130).
Build a foundation for more complex analog or digital IC designs.

3. Potential Tools Used
| № | Stage | Purpose | Commercial (Paid) | Open Source / Free | Comments |
|:-:|--------|----------|------------------|--------------------|-----------|
| 1 | **Schematic (Analog)** | Analog circuit design | Cadence Virtuoso Schematic Editor, Spectre, Synopsys Custom Designer | Ngspice, Xschem, LTspice, Qucs-S | Virtuoso — industry standard |
| 2 | **Simulation (Analog)** | SPICE DC/AC/Transient simulation | Cadence Spectre, Synopsys HSPICE, Keysight ADS | Ngspice, Xyce, Qucs-S | Spectre covers analog + RF |
| 3 | **Simulation (Digital)** | HDL simulation and testbenches | Questasim, VCS, Incisive/Xcelium | Icarus Verilog, GHDL, Verilator | You already have Questasim |
| 4 | **Mixed-Signal Co-Simulation (AMS)** | Combined analog + digital simulation | Cadence AMS Designer, Mentor Questa ADMS, Synopsys CustomSim / Verilog-AMS | *(no full open-source analog)* | AMS Designer = standard for Virtuoso |
| 5 | **Synthesis (Digital → Gate)** | HDL to gate-level conversion | Synopsys Design Compiler, Cadence Genus, Mentor Precision | Yosys | Yosys works great with open PDKs |
| 6 | **Place & Route (Digital Backend)** | Automatic logic placement | Cadence Innovus, Synopsys IC Compiler II, Mentor Nitro | OpenROAD, TritonRoute, RePlAce | OpenROAD supports SKY130 |
| 7 | **Analog Layout** | Manual topological layout | Virtuoso Layout Suite | Magic VLSI, KLayout | Virtuoso — standard for analog |
| 8 | **DRC / LVS** | Design rule and layout verification | Mentor Calibre, Cadence Assura / PVS, Synopsys ICV | KLayout DRC/LVS, Netgen, Magic | Calibre — industry standard |
| 9 | **Parasitic Extraction (PEX)** | Extract parasitic R/C | Cadence QRC, Synopsys StarRC, Mentor Calibre xRC | Magic extraction, KLayout + Netgen | Critical for analog ICs |
| 10 | **Static Timing Analysis (STA)** | Timing checks after synthesis | Synopsys PrimeTime, Cadence Tempus | OpenSTA | Used for digital designs |
| 11 | **Power / IR-drop / EM Analysis** | Power and current analysis | Voltus, RedHawk, Totem | — | Not required for small ICs |
| 12 | **GDS II Export** | Mask generation for fab | Virtuoso Stream Out, Innovus Stream Out | Magic, KLayout | GDSII — foundry format |
| 13 | **Tape-out / Foundry Interface** | Preparing for manufacturing | — (internal foundry toolkits) | Efabless Shuttle (SkyWater 130nm) | Sky130 MPW shuttle is free |
| 14 | **Automation / Scripting** | Automating flow and simulations | Cadence SKILL, TCL, Python APIs | Python (PySpice, gdspy, gdstk) | Python is essential for solo work |
| 15 | **Functional Verification** | HDL and mixed-signal verification | UVM / Questasim / Xcelium | Verilator + cocotb, GHDL + Python | cocotb is a modern verification tool |

4. Description
The project demonstrates the complete flow from schematic to layout for a minimal IC.
It aims to serve as a starting point for students, hobbyists, and researchers interested in open-source silicon design.

5. License
This project is open-source and intended for educational and non-commercial use.
Feel free to fork, modify, and learn!
