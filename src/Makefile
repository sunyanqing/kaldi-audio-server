all:

KALDI_ROOT?=../

ifeq ("$(wildcard $(KALDI_ROOT)/src/kaldi.mk)","")
$(error Cannot find Kaldi's makefile $(KALDI_ROOT)/src/kaldi.mk. \
Specify Kaldi's root directory using KALDI_ROOT when issuing make, e.g.: `KALDI_ROOT=/home/speech/kaldi make` )
endif

EXTRA_CXXFLAGS += -Wno-sign-compare -I $(KALDI_ROOT)/tools/portaudio/install/include
include $(KALDI_ROOT)/src/kaldi.mk
ifneq ($(KALDI_FLAVOR), dynamic)
$(error Kaldi must compiled with dynamic libraries support. Run configure with --shared flag. )
endif
ifeq ($(UNAME), Linux)
  ifneq "$(wildcard $(KALDI_ROOT)/tools/portaudio/install/lib/libportaudio.a)" ""
    EXTRA_LDLIBS = $(KALDI_ROOT)/tools/portaudio/install/lib/libportaudio.a
  else
    EXTRA_LDLIBS = $(KALDI_ROOT)/tools/portaudio/install/lib64/libportaudio.a
  endif
  ifneq ($(wildcard $(KALDI_ROOT)/tools/portaudio/install/include/pa_linux_alsa.h),)
    EXTRA_LDLIBS += -lasound -lrt
  else
    EXTRA_LDLIBS += -lrt
  endif
  ifneq ($(wildcard $(KALDI_ROOT)/tools/portaudio/install/include/pa_jack.h),)
    EXTRA_LDLIBS += -ljack
  endif
endif

CXXFLAGS += -I$(KALDI_ROOT)/src

BINFILES = audio-server-online2-nnet2 audio-server-online2-nnet3

OBJFILES =

TESTFILES =

ADDLIBS = $(KALDI_ROOT)/src/online2/kaldi-online2.a \
          $(KALDI_ROOT)/src/online/kaldi-online.a \
          $(KALDI_ROOT)/src/ivector/kaldi-ivector.a \
          $(KALDI_ROOT)/src/nnet2/kaldi-nnet2.a \
          $(KALDI_ROOT)/src/nnet3/kaldi-nnet3.a \
          $(KALDI_ROOT)/src/lat/kaldi-lat.a \
          $(KALDI_ROOT)/src/decoder/kaldi-decoder.a \
          $(KALDI_ROOT)/src/cudamatrix/kaldi-cudamatrix.a \
          $(KALDI_ROOT)/src/feat/kaldi-feat.a \
          $(KALDI_ROOT)/src/transform/kaldi-transform.a \
          $(KALDI_ROOT)/src/gmm/kaldi-gmm.a \
          $(KALDI_ROOT)/src/thread/kaldi-thread.a \
          $(KALDI_ROOT)/src/hmm/kaldi-hmm.a \
          $(KALDI_ROOT)/src/tree/kaldi-tree.a \
          $(KALDI_ROOT)/src/matrix/kaldi-matrix.a \
          $(KALDI_ROOT)/src/fstext/kaldi-fstext.a \
          $(KALDI_ROOT)/src/util/kaldi-util.a \
          $(KALDI_ROOT)/src/base/kaldi-base.a

all: $(BINFILES)


include $(KALDI_ROOT)/src/makefiles/default_rules.mk



