LOCAL_PATH := $(call my-dir)

GST_OMX_TOP := $(LOCAL_PATH)

include $(CLEAR_VARS)

include $(GST_OMX_TOP)/util/Android.mk
include $(GST_OMX_TOP)/omx/Android.mk
