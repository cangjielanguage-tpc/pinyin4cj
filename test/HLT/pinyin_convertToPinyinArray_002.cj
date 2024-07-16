//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*

@Test
public class pinyin_convertToPinyinArray_002 {
    @TestCase
    public func pinyin_convertToPinyinArray_006():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray(r'稱', PinyinFormat.WITH_TONE_MARK)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[chēng, chèn, chèng]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_007():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray(r'國', PinyinFormat.WITH_TONE_MARK)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[guó]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_008():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray(r'稱', PinyinFormat.WITHOUT_TONE)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[cheng, chen, cheng]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_009():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray(r'稱', PinyinFormat.WITH_TONE_NUMBER)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[cheng1, chen4, cheng4]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_010():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray(r'稱', PinyinFormat.FIRST_LETTER)
        println("arrstr5 = ${arrstr}")
        @Assert(arrstr.toString(),"[c, c, c]")
    }
}