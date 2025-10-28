# ============================================================
# Makefile for SystemVerilog + UVM simulation (QuestaSim / Verilator)
# Project root: /opt/projects/BasIC
# Example:
#   make comp SIM=QUESTA
#   make run SIM=QUESTA uvm_test=tc_hello_world
# ============================================================

# ==== Makefile arguments ====
SIM ?= QUESTA


# ==== Project structure ====
PROJ_ROOT   := /opt/projects/BasIC
RTL_DIR     := $(PROJ_ROOT)/rtl
SYNTH_DIR   := $(PROJ_ROOT)/rtl
VERIF_DIR   := $(PROJ_ROOT)/verif
SOFT_DIR    := $(PROJ_ROOT)/soft
BUILD_DIR   := $(PROJ_ROOT)/build

# ==== Source files ====
RTL_SRCS := $(abspath $(wildcard $(RTL_DIR)/*.sv))
TB_SRCS  := $(abspath $(wildcard $(VERIF_DIR)/*.sv))


TOP_MODULE  := tb_hello_world

# ==== UVM test ====
uvm_test ?= tc_hello_world

# ==== Targets ====
.PHONY: all compile elaborate comp run clean help

all: run

# ============================================================
# QuestaSim flow
# ============================================================
ifeq ($(SIM),QUESTA)

compile:
	@echo "=== [QuestaSim] Compilation phase ==="
	mkdir -p $(BUILD_DIR)/questa
	cd $(BUILD_DIR)/questa && vlib work
	cd $(BUILD_DIR)/questa && vlog -sv +acc=rn +define+UVM_NO_DEPRECATED \
		+incdir+$(VERIF_DIR) $(RTL_SRCS) $(TB_SRCS)

elaborate:
	@echo "=== [QuestaSim] Elaboration phase ==="
	cd $(BUILD_DIR)/questa && vsim -c -quiet -do "quit" $(TOP_MODULE)

comp: compile elaborate

run:
	@echo "=== [QuestaSim] Run phase ==="
	cd $(BUILD_DIR)/questa && vsim -c $(TOP_MODULE) \
		+UVM_TESTNAME=$(uvm_test) \
		-do "run -all; quit"

endif

# ============================================================
# Verilator flow
# ============================================================
ifeq ($(SIM),VERILATOR)

compile:
	@echo "=== [Verilator] Compilation phase ==="
	mkdir -p $(BUILD_DIR)/verilator
	verilator -Wall --cc -sv $(RTL_SRCS) $(TB_SRCS) \
		--Mdir $(BUILD_DIR)/verilator

elaborate:
	@echo "=== [Verilator] Elaboration phase ==="
	verilator --exe --build -sv $(RTL_SRCS) $(TB_SRCS) \
		--top-module $(TOP_MODULE) \
		-o $(BUILD_DIR)/verilator/sim_$(TOP_MODULE)

comp: compile elaborate

run:
	@echo "=== [Verilator] Run phase ==="
	$(BUILD_DIR)/verilator/sim_$(TOP_MODULE) +UVM_TESTNAME=$(uvm_test)

endif

# ============================================================
# Cleanup
# ============================================================
clean:
	@echo "=== Cleaning build directory ==="
	rm -rf $(BUILD_DIR)

# ============================================================
# Help
# ============================================================
help:
	@echo ""
	@echo "Usage:"
	@echo "  make comp SIM=<QUESTA|VERILATOR>             — compile + elaborate"
	@echo "  make run SIM=<QUESTA|VERILATOR> uvm_test=<test> — run simulation"
	@echo "  make clean                                  — clean build directory"
	@echo ""
