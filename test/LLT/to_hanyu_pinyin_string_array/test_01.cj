// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import unittest.*
from std import unittest.testmacro.*

main() {    
    let TestHanYuArray = TestHanYuArray()
    TestHanYuArray.defaultFormatTest()
    TestHanYuArray.combinationFormatTest()
    return 0
}

@Test
public class TestHanYuArray {
    @TestCase
    public func defaultFormatTest(): Unit {
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()

        let pinyinArray1: Array<String> = PinyinHelper.toHanyuPinyinStringArray('李', defaultFormat)
        @Assert(["li3"], pinyinArray1)

        let pinyinArray2: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat)
        @Assert(["lu:3"], pinyinArray2)

        let pinyinArray3: Array<String> = PinyinHelper.toHanyuPinyinStringArray('间', defaultFormat)
        @Assert(["jian1", "jian4"], pinyinArray3)

        let pinyinArray4: Array<String> = PinyinHelper.toHanyuPinyinStringArray('好', defaultFormat)
        @Assert(["hao3", "hao4"], pinyinArray4)

    }

    public func combinationFormatTest(): Unit {
        let defaultFormat1: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat1.setVCharType(HanyuPinyinVCharType.WITH_V)
        defaultFormat1.setToneType(HanyuPinyinToneType.WITH_TONE_NUMBER)
        let pinyinArray1: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat1)
        @Assert(["lv3"], pinyinArray1)
        
        let defaultFormat2: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat2.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat2.setToneType(HanyuPinyinToneType.WITH_TONE_NUMBER)
        let pinyinArray2: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat2)
        @Assert(["lü3"], pinyinArray2)

        let defaultFormat3: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat3.setVCharType(HanyuPinyinVCharType.WITH_U_AND_COLON)
        defaultFormat3.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
        let pinyinArray3: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat3)
        @Assert(["lu:"], pinyinArray3)

        let defaultFormat4: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat4.setVCharType(HanyuPinyinVCharType.WITH_V)
        defaultFormat4.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
        let pinyinArray4: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat4)
        @Assert(["lv"], pinyinArray4)

        let defaultFormat5: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat5.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat5.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
        let pinyinArray5: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat5)
        @Assert(["lü"], pinyinArray5)

        let defaultFormat6: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat6.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat6.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray6: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat6)
        @Assert(["lǚ"], pinyinArray6)

        let defaultFormat7: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat7.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat7.setVCharType(HanyuPinyinVCharType.WITH_U_AND_COLON)
        defaultFormat7.setToneType(HanyuPinyinToneType.WITH_TONE_NUMBER)
        let pinyinArray7: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat7)
        @Assert(["LU:3"], pinyinArray7)

        let defaultFormat8: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat8.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat8.setVCharType(HanyuPinyinVCharType.WITH_V)
        defaultFormat8.setToneType(HanyuPinyinToneType.WITH_TONE_NUMBER)
        let pinyinArray8: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat8)
        @Assert(["LV3"], pinyinArray8)

        let defaultFormat9: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat9.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat9.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat9.setToneType(HanyuPinyinToneType.WITH_TONE_NUMBER)
        let pinyinArray9: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat9)
        @Assert(["LÜ3"], pinyinArray9)

        let defaultFormat10: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat10.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat10.setVCharType(HanyuPinyinVCharType.WITH_U_AND_COLON)
        defaultFormat10.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
        let pinyinArray10: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat10)
        @Assert(["LU:"], pinyinArray10)

        let defaultFormat11: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat11.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat11.setVCharType(HanyuPinyinVCharType.WITH_V)
        defaultFormat11.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
        let pinyinArray11: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat11)
        @Assert(["LV"], pinyinArray11)

        let defaultFormat12: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat12.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat12.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat12.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
        let pinyinArray12: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat12)
        @Assert(["LÜ"], pinyinArray12)

        let defaultFormat13: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat13.setCaseType(HanyuPinyinCaseType.UPPERCASE)
        defaultFormat13.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat13.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray13: Array<String> = PinyinHelper.toHanyuPinyinStringArray('吕', defaultFormat13)
        println(pinyinArray13)
        //@Assert(["Lǚ"], pinyinArray13)
    }
}