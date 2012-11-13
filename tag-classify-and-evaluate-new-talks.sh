#!/bin/bash

mkdir data/mallet
ruby divide-documents-by-acceptance.rb
mallet import-dir --input data/partitioned_talks/* --output data/mallet/all-talks.mallet
mallet train-classifier --input data/mallet/all-talks.mallet --training-portion 0.9 --report train:accuracy test:f1:accepted --output-classifier data/mallet/classifier
ruby dump-documents-one-per-file.rb

mallet classify-dir --input data/talks --output data/mallet/classified-talks --classifier data/mallet/classifier
ruby convert-classification-data-into-score-titles.rb
