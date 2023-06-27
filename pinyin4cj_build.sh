#!/bin/bash -l

cjpm clean
cjpm build
cp -r ./resource/ ./build/pinyin4cj/
