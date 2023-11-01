#!/bin/bash -l

cjpm clean
cjpm build
cp -r ./resource/pinyin.dict.txt ./build/release/pinyin4cj/
