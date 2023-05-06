#!/bin/bash -l

cpm clean
cpm build
# cjpm build --coverage
cp -r ./resource/ ./build/pinyin4cj/
