# ============================================================
# Unified Makefile for SystemVerilog + UVM (QuestaSim)
# and Python cocotb + pyuvm (Verilator)
# ============================================================

# ==== Arguments ====
SIM        ?= QUESTA
uvm_test   ?= hello_world

# ==== Paths ====
PROJ_ROOT  := /opt/projects/BasIC
RTL_DIR    := $(PROJ_ROOT)/rtl
VERIF_DIR  := $(PROJ_ROOT)/verif
BUILD_DIR  := $(PROJ_ROOT)/build

# ==== Sources ====
RTL_SRCS   := $(abspath $(wildcard $(RTL_DIR)/*.sv))
TB_SRCS    := $(abspath $(wildcard $(VERIF_DIR)/*.sv))
TOP_MODULE := tb_$(uvm_test)

.PHONY: all compile elaborate comp run clean help

all: run


# ============================================================
# QuestaSim (SystemVerilog + UVM)
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
		+UVM_TESTNAME=tc_$(uvm_test) \
		-do "run -all; quit"

endif


# ============================================================
# Verilator (Python cocotb + pyuvm)
# ============================================================
ifeq ($(SIM),VERILATOR)

compile:
	@echo "=== [Verilator + cocotb + pyuvm] Compilation phase ==="
	@mkdir -p $(BUILD_DIR)/verilator_py

elaborate:
	@echo "=== [Verilator + cocotb + pyuvm] Elaboration phase ==="
	@mkdir -p $(BUILD_DIR)/verilator_py

comp: compile elaborate

run:
	@echo "=== [Verilator + cocotb + pyuvm] Run phase ==="
	@if [ -f $(VERIF_DIR)/tb_$(uvm_test).py ]; then \
		echo ">> Python UVM test found: $(VERIF_DIR)/tb_$(uvm_test).py"; \
		cd $(BUILD_DIR)/verilator_py && \
		TOPLEVEL_LANG=verilog \
		SIM=verilator \
		PYTHONPATH=$(VERIF_DIR):$$PYTHONPATH \
		VERILOG_SOURCES=$(RTL_DIR)/$(uvm_test).sv \
		EXTRA_ARGS="--top-module $(uvm_test)" \
		COCOTB_TOPLEVEL=$(uvm_test) \
		COCOTB_TEST_MODULES=tb_$(uvm_test) \
		make -f $$(cocotb-config --makefiles)/Makefile.sim; \
	else \
		echo "!! ERROR: Python testbench not found: $(VERIF_DIR)/tb_$(uvm_test).py"; \
		exit 1; \
	fi

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
	@echo "  make comp SIM=QUESTA                  — compile QuestaSim"
	@echo "  make comp SIM=VERILATOR               — compile Verilator"
	@echo "  make run uvm_test=<name> SIM=QUESTA   — run UVM test in QuestaSim"
	@echo "  make run uvm_test=<name> SIM=VERILATOR — run pyuvm+cocotb test"
	@echo "  make clean                            — clean build directory"
	@echo ""
