//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_convertToPinyinArray_001 {
    @TestCase
    public func pinyin_convertToPinyinArray_001():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray('答', PinyinFormat.WITH_TONE_MARK)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[dá, dā]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_002():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray('人', PinyinFormat.WITH_TONE_MARK)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[rén]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_003():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray('答', PinyinFormat.WITHOUT_TONE)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[da, da]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_004():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray('答', PinyinFormat.WITH_TONE_NUMBER)
        println("arrstr = ${arrstr}")
        @Assert(arrstr.toString(),"[da2, da1]")
    }
    @TestCase
    public func pinyin_convertToPinyinArray_005():Unit{
        var arrstr = PinyinHelper.convertToPinyinArray('答', PinyinFormat.FIRST_LETTER)
        println("arrstr5 = ${arrstr}")
        @Assert(arrstr.toString(),"[d, d]")
    }
}