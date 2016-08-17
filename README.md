
An Audio Server based on Kaldi
================================

This project shows how to build an ASR service based on Kaldi, a famous Speech Recognition Toolkit.

Currently, two server side program `audio-server-online2-nnet2` and `audio-server-online2-nnet3` are provided. 
They are based on online2 & nnet2/nnet3(chain), and provide multi tcp service at the same time. 
More features that maybe useful for a practical system, as well as client side demo will be added later.

To start, you need to INSTALL Kaldi from [main Kaldi repository] (https://github.com/kaldi-asr/kaldi) in GitHub. 
`Make ext` maybe also required. Then build `audio-server-online2-nnet2` and `audio-server-online2-nnet3` based on Kaldi.

To test, you could use any online2 & nnet2/nnet3(chain) model trained with kaldi, such as [Api.ai kaldi Speech Recognition Model] (https://api.ai/downloads/api.ai-kaldi-asr-model.zip) or [Librispeech TDNN models with silence probability] (http://kaldi-asr.org/downloads/build/10/trunk/egs/librispeech/s5/archive.tar.gz).


A simple example using nnet3 model
------------------
- . ./path.sh
- nohup audio-server-online2-nnet3 --acoustic-scale=1.0 --beam=11.0 --frame-subsampling-factor=3 --lattice-beam=4.0 --max-active=5000 --config=exp/api.ai-model/conf/online.conf --word-symbol-table=exp/api.ai-model/words.txt data/lang_nosp/phones/align_lexicon.int exp/api.ai-model/final.mdl exp/api.ai-model/HCLG.fst &

A simple example using nnet2 model
------------------
- nohup audio-server-online2-nnet2 --config=exp/nnet2_online/nnet_ms_a_online/conf/online_nnet2_decoding.conf --word-symbol-table=data/lang/words.txt data/lang/phones/align_lexicon.int exp/nnet2_online/nnet_ms_a_online/final.mdl exp/nnet2_online/nnet_ms_a_online/graph_test/HCLG.fst &

Test
------------------
- online-audio-client localhost 5010 'scp:data/test_clean_example/wav.scp'
