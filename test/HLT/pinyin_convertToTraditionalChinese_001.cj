//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*

@Test
public class pinyin_convertToTraditionalChinese001{
    @TestCase
    public func pinyin_convertToTraditionalChinese001():Unit{
        var str = ChineseHelper.convertToTraditionalChinese("国会")
        println("str = ${str}")
        @Assert(str,"國會")      
    }
    @TestCase
    public func pinyin_convertToTraditionalChinese002():Unit{
        var str = ChineseHelper.convertToTraditionalChinese("")
        println("str = ${str}")
        @Assert(str,"")   
    }
    @TestCase
    public func pinyin_convertToTraditionalChinese003():Unit{
        var str = ChineseHelper.convertToTraditionalChinese("中國")
        println("str = ${str}")
        @Assert(str,"中國")   
    }
    @TestCase
    public func pinyin_convertToTraditionalChinese004():Unit{
        var str = ChineseHelper.convertToTraditionalChinese("中国123")
        println("str = ${str}")
        @Assert(str,"中國123")   
    }
    @TestCase
    public func pinyin_convertToTraditionalChinese005():Unit{
        var str = ChineseHelper.convertToTraditionalChinese("中国 666")
        println("str = ${str}")
        @Assert(str,"中國 666")   
    }
   
}