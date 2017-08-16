#!/bin/bash
# Copyright 2016 Yanqing Sun, Junjie Wang
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
# WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
# MERCHANTABLITY OR NON-INFRINGEMENT.
# See the Apache 2 License for the specific language governing permissions and
# limitations under the License.
#

. ./path.sh || exit 1

audio-server-online2-nnet2 --config=exp/nnet2_online/nnet_ms_a_online/conf/online_nnet2_decoding.conf \
                           --word-symbol-table=data/lang/words.txt \
                           data/lang/phones/align_lexicon.int exp/nnet2_online/nnet_ms_a_online/final.mdl \
                           exp/nnet2_online/nnet_ms_a_online/graph_test/HCLG.fst
