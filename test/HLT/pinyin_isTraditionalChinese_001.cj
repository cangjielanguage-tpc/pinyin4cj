//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_isTraditionalChinese_001 {
    @TestCase
    public func pinyin_isTraditionalChinese_001():Unit{
        var tf = ChineseHelper.isTraditionalChinese('國')
        println("tf = ${tf}")
        @Assert(tf,true)    
    }
    @TestCase
    public func pinyin_isTraditionalChinese_002():Unit{
        var tf = ChineseHelper.isTraditionalChinese('国')
        println("tf = ${tf}")
        @Assert(tf,false)    
    }
}