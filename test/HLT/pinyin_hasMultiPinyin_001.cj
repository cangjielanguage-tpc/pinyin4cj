//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_hasMultiPinyin_001 {
    @TestCase
    public func pinyin_hasMultiPinyin_001():Unit{
        var tf = PinyinHelper.hasMultiPinyin('答')
        println("tf = ${tf}")
        @Assert(tf,true)
    }
    @TestCase
    public func pinyin_hasMultiPinyin_002():Unit{
        var tf = PinyinHelper.hasMultiPinyin('人')
        println("tf = ${tf}")
        @Assert(tf,false)
    }
}