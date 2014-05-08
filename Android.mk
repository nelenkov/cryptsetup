LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE:= popt

LOCAL_SRC_FILES :=  popt/popt.c \
					popt/poptconfig.c \
					popt/popthelp.c \
					popt/poptint.c \
					popt/poptparse.c
LOCAL_CFLAGS+=-DHAVE_CONFIG_H
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += \
				$(LOCAL_PATH)/dm/misc \
				$(LOCAL_PATH)/dm/datastruct  \
				$(LOCAL_PATH)/dm/ioctl  \
				$(LOCAL_PATH)/dm/mm   \
				$(LOCAL_PATH)/dm/regex \
				$(LOCAL_PATH)/dm 
LOCAL_SRC_FILES :=  dm/datastruct/bitset.c \
					dm/datastruct/hash.c \
					dm/datastruct/list.c \
					dm/libdm-common.c \
					dm/libdm-file.c \
					dm/libdm-deptree.c \
					dm/libdm-string.c \
					dm/libdm-report.c \
					dm/mm/dbg_malloc.c \
					dm/mm/pool.c \
					dm/regex/matcher.c \
					dm/regex/parse_rx.c \
					dm/regex/ttree.c \
					dm/ioctl/libdm-iface.c  

LOCAL_MODULE    := devmapper 

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := uuid
LOCAL_SRC_FILES :=  uuid/clear.c  \
					uuid/compare.c \
					uuid/copy.c \
					uuid/gen_uuid.c \
					uuid/isnull.c \
					uuid/pack.c \
					uuid/parse.c \
					uuid/unpack.c \
					uuid/unparse.c 

LOCAL_MODULE := uuid

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE:= crypto_backend
LOCAL_C_INCLUDES += external/openssl/include
LOCAL_SRC_FILES :=  lib/crypto_backend/crc32.c \
					lib/crypto_backend/crypto_openssl.c \
					lib/crypto_backend/crypto_cipher_kernel.c \
					lib/crypto_backend/crypto_kernel.c \
					lib/crypto_backend/pbkdf2_generic.c \
					lib/crypto_backend/pbkdf_check.c

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE:= veritysetup
LOCAL_CPPFLAGS := -DPRIu64="lu"
LOCAL_C_INCLUDES += $(LOCAL_PATH)/lib \
					$(LOCAL_PATH)/lib/crypto_backend \
					$(LOCAL_PATH)/lib/loopaes \
					$(LOCAL_PATH)/lib/luks1 \
					$(LOCAL_PATH)/lib/tcrypt \
					$(LOCAL_PATH)/lib/verity \
					$(LOCAL_PATH)/dm 

LOCAL_SRC_FILES :=  veritysetup.c \
					lib/libdevmapper.c \
					lib/random.c \
					lib/setup.c \
					lib/utils.c \
					lib/utils_benchmark.c \
					lib/utils_crypt.c \
					lib/utils_device.c \
					lib/utils_devpath.c \
					lib/utils_fips.c \
					lib/utils_loop.c \
					lib/utils_wipe.c \
					lib/volumekey.c \
					utils_tools.c \
					lib/verity/verity.c \
					lib/verity/verity_hash.c \
					lib/luks1/af.c \
					lib/luks1/keymanage.c \
					lib/luks1/keyencryption.c \
					lib/tcrypt/tcrypt.c 

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES += popt devmapper crypto_backend uuid
LOCAL_STATIC_LIBRARIES += libcrypto_static libc libm

include $(BUILD_EXECUTABLE)
