#!/bin/bash

mkdir data/mallet
ruby divide-documents-by-acceptance.rb
mallet import-dir --input data/partitioned_talks/* --output data/mallet/all-talks.mallet
mallet train-classifier --input data/mallet/all-talks.mallet --training-portion 0.9  --num-trials 10 --cross-validation 10 --report train:accuracy test:f1:accepted --output-classifier data/mallet/classifier
ruby dump-documents-one-per-file.rb

mallet classify-dir --input data/talks --output - --classifier data/mallet/classifier.trial0
