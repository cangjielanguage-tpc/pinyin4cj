#!/bin/bash -l

cjpm clean
#cjpm build
cjpm build --coverage
cp -r ./resource/ ./build/pinyin4cj/
