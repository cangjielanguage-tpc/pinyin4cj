//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_getShortPinyin_001 {
    @TestCase
    public func pinyin_getShortPinyin_001():Unit{
        var pinyin = PinyinHelper.getShortPinyin("爱我中华")
        println("pinyin = ${pinyin}")
        @Assert(pinyin,"awzh")    
    }
    @TestCase
    public func pinyin_getShortPinyin_002():Unit{
        var pinyin = PinyinHelper.getShortPinyin("爱我中國")
        println("pinyin = ${pinyin}")
        @Assert(pinyin,"awzg")    
    }
    @TestCase
    public func pinyin_getShortPinyin_003():Unit{
        var pinyin = PinyinHelper.getShortPinyin("")
        println("pinyin = ${pinyin}")
        @Assert(pinyin,"")    
    }
    @TestCase
    public func pinyin_getShortPinyin_004():Unit{
        var pinyin = PinyinHelper.getShortPinyin("wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。")
        println("pinyin = ${pinyin}")
        @Assert(pinyin,"wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。")    
    }
    @TestCase
    public func pinyin_getShortPinyin_005():Unit{
        var pinyin = PinyinHelper.getShortPinyin("wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。爱我")
        println("pinyin = ${pinyin}")
        @Assert(pinyin,"wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。aw")    
    }

}