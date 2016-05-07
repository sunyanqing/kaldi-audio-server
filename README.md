
An Audio Server based on Kaldi
================================

This project shows how to build an ASR service based on Kaldi, a famous Speech Recognition Toolkit.

Currently, a server side program `audio-server-online2-nnet2` is provided. 
It is based on online2 & nnet2, and provides multi tcp service at the same time. 
More features that maybe useful for a practical system, as well as client side demo will be added later.

To start, you need to INSTALL Kaldi from [main Kaldi repository] (https://github.com/kaldi-asr/kaldi) in GitHub. 
`Make ext` maybe also required. Then build `audio-server-online2-nnet2` based on Kaldi.

To test, you could use any online2 & nnet2 model trained with kaldi, such as [Librispeech TDNN models with silence probability] (http://kaldi-asr.org/downloads/build/10/trunk/egs/librispeech/s5/archive.tar.gz).

- . ./path.sh
- nohup audio-server-online2-nnet2 --config=exp/nnet2_online/nnet_ms_a_online/conf/online_nnet2_decoding.conf --word-symbol-table=data/lang/words.txt data/lang/phones/align_lexicon.int exp/nnet2_online/nnet_ms_a_online/final.mdl exp/nnet2_online/nnet_ms_a_online/graph_test/HCLG.fst &
- online-audio-client localhost 5010 'scp:data/test_clean_example/wav.scp'
