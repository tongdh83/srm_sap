//
// Package for the blockA env
//

package blockA_env_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import srm_pkg::*; 
  import blockA_srm_model_pkg::*;     // Required for blockA_srm_reg_sequence.
  import pio_agent_pkg::*;
  `include "blockA_srm_reg_sequence.svh"
  `include "blockA_env_config.svh"
  `include "blockA_env.svh"
endpackage
