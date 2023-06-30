//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*

@Test
public class pinyin_convertToPinyinString_001 {
    @TestCase
    public func pinyin_convertToPinyinString_001():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "")
        println("str = ${str}")
        @Assert(str,"wǒshìzhōngguógòngchǎnzhǔyìjiēbānrén。")      
    }
    @TestCase
    public func pinyin_convertToPinyinString_002():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ")
        println("str = ${str}")
        @Assert(str,"wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。")   
    }
    @TestCase
    public func pinyin_convertToPinyinString_003():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "123")
        println("str = ${str}")
        @Assert(str,"wǒ123shì123zhōng123guó123gòng123chǎn123zhǔ123yì123jiē123bān123rén123。")   
    }
    @TestCase
    public func pinyin_convertToPinyinString_004():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "a")
        println("str = ${str}")
        @Assert(str,"wǒashìazhōngaguóagòngachǎnazhǔayìajiēabānaréna。")   
    }
    @TestCase
    public func pinyin_convertToPinyinString_005():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中國共产主义接班人。", " ")
        println("str = ${str}")
        @Assert(str,"wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。") 
    }
    @TestCase
    public func pinyin_convertToPinyinString_006():Unit{
        var str = PinyinHelper.convertToPinyinString("答应", " ")
        println("str = ${str}")
        @Assert(str,"dā yìng") 
    }
}