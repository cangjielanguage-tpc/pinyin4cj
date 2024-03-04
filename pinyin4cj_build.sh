#!/bin/bash -l

cjpm clean
cjpm build
cp -r ./resource/pinyin.dict.txt ./target/release/pinyin4cj/
