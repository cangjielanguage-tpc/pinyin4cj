//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*

@Test
public class pinyin_isChinese_001 {
    @TestCase
    public func pinyin_isChinese_001():Unit{
        var tf = ChineseHelper.isChinese(r'汉')
        println("tf = ${tf}")
        @Assert(tf,true)    
    }
    @TestCase
    public func pinyin_isChinese_002():Unit{
        var tf = ChineseHelper.isChinese(r'1')
        println("tf = ${tf}")
        @Assert(tf,false)    
    }
    @TestCase
    public func pinyin_isChinese_003():Unit{
        var tf = ChineseHelper.isChinese(r' ')
        println("tf = ${tf}")
        @Assert(tf,false)    
    }
}