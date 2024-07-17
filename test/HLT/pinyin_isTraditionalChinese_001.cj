//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*

@Test
public class pinyin_isTraditionalChinese_001 {
    @TestCase
    public func pinyin_isTraditionalChinese_001():Unit{
        var tf = ChineseHelper.isTraditionalChinese(r'國')
        println("tf = ${tf}")
        @Assert(tf,true)    
    }
    @TestCase
    public func pinyin_isTraditionalChinese_002():Unit{
        var tf = ChineseHelper.isTraditionalChinese(r'国')
        println("tf = ${tf}")
        @Assert(tf,false)    
    }
}