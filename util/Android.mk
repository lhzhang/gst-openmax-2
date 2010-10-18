LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := 				\
	async_queue.c				\
	sem.c

LOCAL_MODULE := libgstomxutil

LOCAL_C_INCLUDES :=				\
	$(GLIB_C_INCLUDES)

ifneq ($(GST_BUILD_STATIC),true)
LOCAL_SHARED_LIBRARIES :=			\
	$(GLIB_SHARED_LIBRARIES)

endif

include $(BUILD_STATIC_LIBRARY)
