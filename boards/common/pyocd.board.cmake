set_ifndef(BOARD_FLASH_RUNNER pyocd)
set_ifndef(BOARD_DEBUG_RUNNER pyocd)

assert(PYOCD_TARGET "PYOCD_TARGET is not set")

set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--target=${PYOCD_TARGET}")

# Compute the address to flash to based on the devicetree.
set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--dt-flash")

if(DEFINED PYOCD_DAPARG)
  set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--daparg=${PYOCD_DAPARG}")
endif()

if(DEFINED PYOCD_FLASHTOOL)
  set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--flashtool=${PYOCD_FLASHTOOL}")
endif()

if(PYOCD_FLASHTOOL_OPTS)
  foreach(option IN LISTS PYOCD_FLASHTOOL_OPTS)
    set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--flashtool-opt=${option}")
  endforeach()
endif()

if(DEFINED PYOCD_GDBSERVER)
  set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--gdbserver=${PYOCD_GDBSERVER}")
endif()

if(DEFINED PYOCD_GDB_PORT)
  set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--gdb-port=${PYOCD_GDB_PORT}")
endif()

if(DEFINED PYOCD_TUI)
  set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--tui")
endif()

if(DEFINED PYOCD_BOARD_ID)
  set_property(GLOBAL APPEND PROPERTY BOARD_RUNNER_ARGS_pyocd "--board-id=${PYOCD_BOARD_ID}")
endif()
