set_ifndef(OPENSDA_FW daplink)

if(OPENSDA_FW STREQUAL jlink)
  set_ifndef(BOARD_DEBUG_RUNNER jlink)
elseif(OPENSDA_FW STREQUAL daplink)
  set_ifndef(BOARD_DEBUG_RUNNER pyocd)
  set_ifndef(BOARD_FLASH_RUNNER pyocd)
endif()

set(JLINK_DEVICE MK64FN1M0xxx12)
set(PYOCD_TARGET k64f)

include($ENV{ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
include($ENV{ZEPHYR_BASE}/boards/common/jlink.board.cmake)
include($ENV{ZEPHYR_BASE}/boards/common/openocd.board.cmake)
