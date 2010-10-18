LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := 				\
	gstomx.c				\
	gstomx_util.c				\
	gstomx_interface.c			\
	gstomx_base_filter.c			\
	gstomx_base_videodec.c			\
	gstomx_base_videoenc.c			\
	gstomx_base_audiodec.c			\
	gstomx_dummy.c				\
	gstomx_volume.c				\
	gstomx_mpeg4dec.c			\
	gstomx_h263dec.c			\
	gstomx_h264dec.c			\
	gstomx_wmvdec.c				\
	gstomx_mpeg4enc.c			\
	gstomx_h264enc.c			\
	gstomx_h263enc.c			\
	gstomx_vorbisdec.c			\
	gstomx_mp3dec.c				\
	gstomx_base_sink.c			\
	gstomx_audiosink.c

ifeq ($(GST_OMX_EXPERIMENTAL), true)
LOCAL_SRC_FILES += 				\
	gstomx_amrnbdec.c			\
	gstomx_amrnbenc.c			\
	gstomx_amrwbdec.c			\
	gstomx_amrwbenc.c			\
	gstomx_aacdec.c				\
	gstomx_aacenc.c				\
	gstomx_mp2dec.c				\
	gstomx_adpcmdec.c			\
	gstomx_adpcmenc.c			\
	gstomx_g711dec.c			\
	gstomx_g711enc.c			\
	gstomx_g729dec.c			\
	gstomx_g729enc.c			\
	gstomx_ilbcdec.c			\
	gstomx_ilbcenc.c			\
	gstomx_jpegenc.c			\
	gstomx_videosink.c			\
	gstomx_base_src.c			\
	gstomx_filereadersrc.c			\
	android-internal/gstomx_conf_exp.c
else
LOCAL_SRC_FILES += 				\
	android-internal/gstomx_conf.c
endif

LOCAL_MODULE := libgstomx$(GST_PLUGINS_SUFFIX)

LOCAL_C_INCLUDES :=				\
	$(GSTREAMER_LIBS_C_INCLUDES)		\
	$(GST_OMX_TOP)/util			\
	$(LOCAL_PATH)/headers			\
	$(GST_OMX_TOP)/android-internal

LOCAL_CFLAGS :=					\
	-DHAVE_CONFIG_H	

ifeq ($(GST_BUILD_STATIC),true)
GST_PLUGINS_STATIC_LIBRARIES +=			\
	$(LOCAL_MODULE)				\
	libgstomxutil

LOCAL_CFLAGS += 				\
	-DSTATIC_PLUGIN_NAME=$(LOCAL_MODULE)

include $(BUILD_STATIC_LIBRARY)
else
LOCAL_SHARED_LIBRARIES :=			\
	$(GLIB_SHARED_LIBRARIES)		\
	$(GST_SHARED_LIBRARIES)

LOCAL_STATIC_LIBRARIES :=			\
	libgstomxutil

LOCAL_LDLIBS :=					\
	-ldl

include $(BUILD_SHARED_LIBRARY)
endif
