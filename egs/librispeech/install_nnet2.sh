#!/bin/bash
# Copyright 2016 Junjie Wang, Yanqing Sun
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

echo "Installing librispeech demo"

if [ ! -e archive.tar.gz ]; then
    echo "Could not find Librispeech TDNN models with silence probability"
    echo "Trying to download it via wget!"
    
    if ! which wget >&/dev/null; then
        echo "This script requires you to first install wget"
        exit 1;
    fi

   wget -T 10 -t 3 -c http://kaldi-asr.org/downloads/build/10/trunk/egs/librispeech/s5/archive.tar.gz

   if [ ! -e archive.tar.gz ]; then
        echo "Download of archive.tar.gz - failed!"
        echo "Aborting script. Please download and install Librispeech TDNN models manually!"
    exit 1;
   fi
fi

tar -xovzf archive.tar.gz|| exit 1

ln -s `pwd`/../../../kaldi/egs/wsj/s5/steps steps
ln -s `pwd`/../../../kaldi/egs/wsj/s5/utils utils
ln -s `pwd`/../../../kaldi/egs/librispeech/s5/local local

. ./decode_example.sh || exit 1

