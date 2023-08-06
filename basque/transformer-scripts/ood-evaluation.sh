#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=1

##directory that contains trained transformer model that we want to evaluate
export TRANSFORMER_BASE_DIR=/gscratch3/users/otoporkov001/articulo/transformers/basque/ses_udpipe/model-xlmroberta-large-all-labels-eu-e15-1/
export CORPUS_DIR=./


for i in 1

do
#mkdir $RESULTS_DIR-$i
  python ../run_conll_ner.py --data_dir=$CORPUS_DIR  \
    --labels eu-all-labels.txt \
    --model_type xlm-roberta \
    --model_name_or_path $TRANSFORMER_BASE_DIR \
    --output_dir=$TRANSFORMER_BASE_DIR \
    --do_predict \
    --do_eval \


  rm $CORPUS_DIR/cached*
done
