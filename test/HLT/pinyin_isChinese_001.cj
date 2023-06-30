//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_isChinese_001 {
    @TestCase
    public func pinyin_isChinese_001():Unit{
        var tf = ChineseHelper.isChinese('汉')
        println("tf = ${tf}")
        @Assert(tf,true)    
    }
    @TestCase
    public func pinyin_isChinese_002():Unit{
        var tf = ChineseHelper.isChinese('1')
        println("tf = ${tf}")
        @Assert(tf,false)    
    }
    @TestCase
    public func pinyin_isChinese_003():Unit{
        var tf = ChineseHelper.isChinese(' ')
        println("tf = ${tf}")
        @Assert(tf,false)    
    }
}