//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_getName_001 {
    @TestCase
    public func pinyin_getName_001():Unit{
        var pinyinFormat = PinyinFormat.WITH_TONE_MARK
        println("pinyinFormat.WITH_TONE_MARK = ${pinyinFormat.getName()}")
        @Assert(pinyinFormat.getName(),"WITH_TONE_MARK")    
    }
    @TestCase
    public func pinyin_getName_002():Unit{
        var pinyinFormat = PinyinFormat.WITHOUT_TONE
        println("pinyinFormat.WITHOUT_TONE = ${pinyinFormat.getName()}")
        @Assert(pinyinFormat.getName(),"WITHOUT_TONE")    
    }
    @TestCase
    public func pinyin_getName_003():Unit{
        var pinyinFormat = PinyinFormat.WITH_TONE_NUMBER
        println("pinyinFormat.WITH_TONE_NUMBER = ${pinyinFormat.getName()}")
        @Assert(pinyinFormat.getName(),"WITH_TONE_NUMBER")    
    }
    @TestCase
    public func pinyin_getName_004():Unit{
        var pinyinFormat = PinyinFormat.FIRST_LETTER
        println("pinyinFormat.FIRST_LETTER = ${pinyinFormat.getName()}")
        @Assert(pinyinFormat.getName(),"FIRST_LETTER")    
    }

}