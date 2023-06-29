//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*

@Test
public class pinyin_convertToSimplifiedChinese_001{
    @TestCase
    public func pinyin_convertToSimplifiedChinese_001():Unit{
        var str = ChineseHelper.convertToSimplifiedChinese("國會")
        println("str = ${str}")
        @Assert(str,"国会")      
    }
    @TestCase
    public func pinyin_convertToSimplifiedChinese_002():Unit{
        var str = ChineseHelper.convertToSimplifiedChinese("")
        println("str = ${str}")
        @Assert(str,"")   
    }
    @TestCase
    public func pinyin_convertToSimplifiedChinese_003():Unit{
        var str = ChineseHelper.convertToSimplifiedChinese("中国")
        println("str = ${str}")
        @Assert(str,"中国")   
    }
    @TestCase
    public func pinyin_convertToSimplifiedChinese_004():Unit{
        var str = ChineseHelper.convertToSimplifiedChinese("中國123")
        println("str = ${str}")
        @Assert(str,"中国123")   
    }
    @TestCase
    public func pinyin_convertToSimplifiedChinese_005():Unit{
        var str = ChineseHelper.convertToSimplifiedChinese("中國 666")
        println("str = ${str}")
        @Assert(str,"中国 666")   
    }
   
}