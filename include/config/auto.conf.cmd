deps_config := \
	/home/axjllt/Desktop/ori_refos/tools/common/Kconfig \
	tools/elfloader/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/nethack/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/snake/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/tetris/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/test_user/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/test_os/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/terminal/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/timer_server/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/console_server/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/file_server/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/selfloader/Kconfig \
	/home/axjllt/Desktop/ori_refos/apps/process_server/Kconfig \
	apps/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libplatsupport/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libvterm/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libutils/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/librefos/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/librefossys/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4utils/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4vka/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4vspace/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4utils/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4simple-default/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4simple/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4platsupport/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4muslcsys/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4debug/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4allocman/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libmuslc/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libelf/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libdatastruct/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libcpio/Kconfig \
	/home/axjllt/Desktop/ori_refos/libs/libsel4/Kconfig \
	libs/Kconfig \
	/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/Kconfig \
	/home/axjllt/Desktop/ori_refos/kernel/src/arch/arm/Kconfig \
	kernel/Kconfig \
	Kconfig

include/config/auto.conf: \
	$(deps_config)

ifneq "$(SEL4_APPS_PATH)" "/home/axjllt/Desktop/ori_refos/apps"
include/config/auto.conf: FORCE
endif
ifneq "$(SEL4_LIBS_PATH)" "/home/axjllt/Desktop/ori_refos/libs"
include/config/auto.conf: FORCE
endif
ifneq "$(COMMON_PATH)" "/home/axjllt/Desktop/ori_refos/tools/common"
include/config/auto.conf: FORCE
endif
ifneq "$(KERNEL_ROOT_PATH)" "/home/axjllt/Desktop/ori_refos/kernel"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
