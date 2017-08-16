export KALDI_ROOT=`pwd`/../../../kaldi
export KALDI_AUDIO_SERVER_ROOT=`pwd`/../..
export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$PWD:$PATH:$KALDI_AUDIO_SERVER_ROOT/src
[ ! -f $KALDI_ROOT/tools/config/common_path.sh ] && echo >&2 "The standard file $KALDI_ROOT/tools/config/common_path.sh is not present -> Exit!" && exit 1
. $KALDI_ROOT/tools/config/common_path.sh
export LC_ALL=C

