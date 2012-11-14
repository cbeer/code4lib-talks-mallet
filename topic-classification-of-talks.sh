#!/bin/bash

NUM_TOPICS=25
NUM_TOP_WORDS=15

rm -rf data/mallet
mkdir data/mallet
mallet import-dir --input data/talks --output data/mallet/talks.mallet --keep-sequence --remove-stopwords
mallet train-topics --input data/mallet/talks.mallet --output-model data/mallet/talks-topic-model.gz --num-topics $NUM_TOPICS --num-threads 2 --num-iterations 1000 --doc-topics-threshold 0.1 --optimize-interval 10 --num-top-words $NUM_TOP_WORDS --output-doc-topics data/mallet/topics.txt --output-topic-keys data/mallet/keys.txt

mallet import-dir --input data/partitioned_talks/accepted --output data/mallet/accepted_talks.mallet --keep-sequence --remove-stopwords
mallet train-topics --input data/mallet/accepted_talks.mallet --output-model data/mallet/accepted_talks-topic-model.gz --num-topics $NUM_TOPICS --num-threads 2 --num-iterations 1000 --doc-topics-threshold 0.1 --optimize-interval 10 --num-top-words $NUM_TOP_WORDS --output-doc-topics data/mallet/accepted_talks_topics.txt --output-topic-keys data/mallet/accepted_talks_keys.txt

