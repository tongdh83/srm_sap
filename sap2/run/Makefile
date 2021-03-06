#
# Makefile for SAP2
#
ifndef UVM_HOME
  $(error UVM_HOME is undefied. Point it to install dir for uvm package)
endif

ifndef SRM_HOME
  $(error SRM_HOME is undefied. Point it to install dir for simple_reg_model)
endif

ifndef SAP_HOME
  $(error SAP_HOME is undefied. Point it to this installation dir)
endif

VCS = vcs -sverilog -timescale=1ns/1ns +acc +vpi -debug_all\
      +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
      +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv  \
	  +incdir+$(SRM_HOME)/src $(SRM_HOME)/src/srm.sv \
      +incdir+$(SAP_HOME)/sap2/tb +incdir+$(SAP_HOME)/agents/host \
	  +incdir+$(SAP_HOME)/agents/pio \
	  +incdir+$(SAP_HOME)/sap2/env +incdir+$(SAP_HOME)/sap2/tests \
      +incdir+$(SAP_HOME)/blockA/regmodel \
      +incdir+$(SAP_HOME)/blockA/sequences \
      +incdir+$(SAP_HOME)/blockA/backdoor \
      +incdir+$(SAP_HOME)/sap1/regmodel \
      +incdir+$(SAP_HOME)/sap2/regmodel \
      $(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS

SIMV = simv -l test.log

DESIGN = $(SAP_HOME)/sap1/dut/clkgen_if.sv \
         $(SAP_HOME)/agents/host/host_if.sv \
         $(SAP_HOME)/agents/pio/pio_if.sv  \
         $(SAP_HOME)/agents/pio/pio_wrapper_if.sv  \
	     $(SAP_HOME)/sap1/dut/host.sv   \
	     $(SAP_HOME)/blockA/dut/blockA.sv \
	     $(SAP_HOME)/sap1/dut/sap1.sv   \
	     $(SAP_HOME)/sap2/dut/sap2.sv   

TB = $(SAP_HOME)/sap2/tb/tb.sv \
	 $(SAP_HOME)/agents/host/host_agent_pkg.sv \
     $(SAP_HOME)/agents/pio/pio_agent_pkg.sv \
     $(SAP_HOME)/blockA/regmodel/blockA_srm_model_pkg.sv \
     $(SAP_HOME)/blockA/regmodel/blockA_srm_constr_pkg.sv \
     $(SAP_HOME)/sap1/regmodel/sap1_srm_model_pkg.sv \
     $(SAP_HOME)/sap2/regmodel/sap2_srm_model_pkg.sv \
     $(SAP_HOME)/blockA/sequences/blockA_srm_reg_sequences_pkg.sv \
     $(SAP_HOME)/blockA/backdoor/blockA_backdoor_pkg.sv \
     $(SAP_HOME)/sap2/env/sap2_env_pkg.sv \
     $(SAP_HOME)/sap2/tests/sap2_test_pkg.sv

TESTNAME = sap2_srm_test

comp_vcs:
	$(VCS) $(INCDIR) $(DESIGN) $(TB) 

run_vcs: comp_vcs
	$(SIMV) +UVM_TESTNAME=$(TESTNAME) 

clean:
	rm -rf csrc simv simv.daidir vc_hdrs.h DVEfiles *.log *.key *.vpd
