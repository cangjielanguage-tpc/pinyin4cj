//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*

@Test
public class pinyin_hasMultiPinyin_001 {
    @TestCase
    public func pinyin_hasMultiPinyin_001():Unit{
        var tf = PinyinHelper.hasMultiPinyin(r'答')
        println("tf = ${tf}")
        @Assert(tf,true)
    }
    @TestCase
    public func pinyin_hasMultiPinyin_002():Unit{
        var tf = PinyinHelper.hasMultiPinyin(r'人')
        println("tf = ${tf}")
        @Assert(tf,false)
    }
}