# ============================================================
# File: tb_hello_world.py
# Description: cocotb + pyuvm testbench for hello_world.sv
# ============================================================

import cocotb
from cocotb.triggers import Timer
import pyuvm
from pyuvm import uvm_test


# ============================================================
# UVM-like Test
# ============================================================
@pyuvm.test()
class tc_hello_world(uvm_test):
    """Simple pyuvm test equivalent to SystemVerilog UVM test."""

    async def run_phase(self):
        self.logger.info("Starting UVM test...")
        await Timer(10, unit="ns")
        self.logger.info("UVM test completed successfully!")
