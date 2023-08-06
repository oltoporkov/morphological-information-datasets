#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=4
export MAX_LENGTH=128
export TRAIN_BATCH_SIZE=32
export LEARNING_RATE=5e-5
export SAVE_STEPS=0
export SEED=1
export EPOCHS=10
export TRANSFORMER_BASE_DIR=ixa-ehu/berteus-base-cased
export CORPUS_DIR=./
export RESULTS_DIR="berteus-ixa-all-labels-test-e"$EPOCHS

for i in 1

do
  mkdir $RESULTS_DIR-$i
  python ../run_conll_ner.py --data_dir=$CORPUS_DIR  \
    --labels ./eu-all-labels.txt \
    --model_type bert \
    --model_name_or_path $TRANSFORMER_BASE_DIR \
    --output_dir=$RESULTS_DIR-$i \
    --max_seq_length $MAX_LENGTH \
    --num_train_epochs=$EPOCHS \
    --per_gpu_train_batch_size $TRAIN_BATCH_SIZE \
    --learning_rate $LEARNING_RATE \
    --save_steps $SAVE_STEPS \
    --seed $SEED \
    --do_train \
    --do_eval \
    --do_predict \

  rm $CORPUS_DIR/cached*
done
