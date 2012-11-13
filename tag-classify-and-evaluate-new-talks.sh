#!/bin/bash

rm -rf data/mallet
mkdir data/mallet
ruby divide-documents-by-acceptance.rb
mallet import-dir --remove-stopwords --input data/partitioned_talks/* --output data/mallet/all-talks.mallet
mallet train-classifier --trainer MaxEnt --input data/mallet/all-talks.mallet --training-portion 0.85 --output-classifier data/mallet/classifier
ruby dump-documents-one-per-file.rb

mallet classify-dir --input data/talks --output data/mallet/classified-talks --classifier data/mallet/classifier
ruby convert-classification-data-into-score-titles.rb
