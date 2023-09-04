#!/bin/bash -l

cjpm clean
cjpm build --coverage
cp -r ./resource/pinyin.dict.txt ./build/pinyin4cj/
