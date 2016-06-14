all:

KALDI_ROOT?=../../kaldi

ifeq ("$(wildcard $(KALDI_ROOT)/src/kaldi.mk)","")
$(error Cannot find Kaldi's makefile $(KALDI_ROOT)/src/kaldi.mk. \
Specify Kaldi's root directory using KALDI_ROOT when issuing make, e.g.: `KALDI_ROOT=/home/speech/kaldi make` )
endif

include $(KALDI_ROOT)/src/kaldi.mk
ifneq ($(KALDI_FLAVOR), dynamic)
$(error Kaldi must compiled with dynamic libraries support. Run configure with --shared flag. )
endif

CXXFLAGS += -I$(KALDI_ROOT)/src

BINFILES = audio-server-online2-nnet2

OBJFILES =

TESTFILES =

ADDLIBS = $(KALDI_ROOT)/src/online2/kaldi-online2.a \
          $(KALDI_ROOT)/src/online/kaldi-online.a \
          $(KALDI_ROOT)/src/ivector/kaldi-ivector.a \
          $(KALDI_ROOT)/src/nnet2/kaldi-nnet2.a \
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

include $(KALDI_ROOT)/src/makefiles/default_rules.mk



