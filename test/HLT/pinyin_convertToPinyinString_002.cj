//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*

@Test
public class pinyin_convertToPinyinString_002 {
    @TestCase
    public func pinyin_convertToPinyinString_007():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ",PinyinFormat.WITH_TONE_MARK)
        println("str = ${str}")
        @Assert(str,"wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。")      
    }
    @TestCase
    public func pinyin_convertToPinyinString_008():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ",PinyinFormat.WITHOUT_TONE)
        println("str = ${str}")
        @Assert(str,"wo shi zhong guo gong chan zhu yi jie ban ren 。")   
    }
    @TestCase
    public func pinyin_convertToPinyinString_009():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ",PinyinFormat.WITH_TONE_NUMBER)
        println("str = ${str}")
        @Assert(str,"wo3 shi4 zhong1 guo2 gong4 chan3 zhu3 yi4 jie1 ban1 ren2 。")   
    }
    @TestCase
    public func pinyin_convertToPinyinString_010():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ",PinyinFormat.FIRST_LETTER)
        println("str = ${str}")
        @Assert(str,"w s z g g c z y j b r 。")   
    }
    @TestCase
    public func pinyin_convertToPinyinString_011():Unit{
        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "",PinyinFormat.WITH_TONE_MARK)
        println("str = ${str}")
        @Assert(str,"wǒshìzhōngguógòngchǎnzhǔyìjiēbānrén。")      
    }
}