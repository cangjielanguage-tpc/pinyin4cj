// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let testPinyinHelper = TestPinyinHelper()
    testPinyinHelper.testTraditionalToSimplified()
    testPinyinHelper.testSimplifiedToTraditional()
    testPinyinHelper.testConversionWordsOrSentencesToPinyin()
    testPinyinHelper.testSimplifiedToPinyin()
    testPinyinHelper.testTraditionalToPinyin()
    testPinyinHelper.testCustomPinyinDictionary()
    testPinyinHelper.testCustomPinyinCombinationDictionary()
    testPinyinHelper.testCustomChineseDictionary()
    testPinyinHelper.testConvertPolyphonicCharactersToPinyin()
    testPinyinHelper.testConvertSimplifiedToPinyinSet()
    testPinyinHelper.testConvertUniversalPinyin()
    return 0
}

@Test
public class TestPinyinHelper {
    @TestCase
    public func testTraditionalToSimplified(): Unit {
        let res1: String = ChineseHelper.convertToSimplifiedChinese("臺，喪，麗")
        @Assert("台，丧，丽", res1)
    }

    @TestCase
    public func testSimplifiedToTraditional(): Unit {
        let res1: String = ChineseHelper.convertToTraditionalChinese("我是中国人")
        @Assert("我是中國人", res1)
    }

    @TestCase
    public func testConversionWordsOrSentencesToPinyin(): Unit {
        let res1: String = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ")
        @Assert("wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。", res1)
    }

    @TestCase
    public func testSimplifiedToPinyin(): Unit {
        let res1: String = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
        @Assert("wo3 shi4 zhong1 guo2 gong4 chan3 zhu3 yi4 jie1 ban1 ren2 。", res1)
    }

    @TestCase
    public func testTraditionalToPinyin(): Unit {
        let res1: String = PinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
        @Assert("wo3 shi4 zhong1 guo2 gong4 chan3 zhu3 yi4 jie1 ban1 ren2 。", res1)
    }

    @TestCase
    public func testCustomPinyinDictionary(): Unit {
        let map: HashMap<String, String> = HashMap<String, String>([("上", "shǎng")])
        PinyinHelper.addPinyinDictResource(map)
        let res1: String = PinyinHelper.convertToPinyinString("上午", " ", PinyinFormat.WITH_TONE_MARK)
        @Assert("shǎng wǔ", res1)
    }

    @TestCase
    public func testCustomPinyinCombinationDictionary(): Unit {
        let map: HashMap<String, String> = HashMap<String, String>([("阿弥陀佛", "ā,mí,tuó,fó")])
        PinyinHelper.addMutilPinyinDictResource(map)
        let res1: String = PinyinHelper.convertToPinyinString("阿弥陀佛", " ", PinyinFormat.WITH_TONE_MARK)
        @Assert("ā mí tuó fó", res1)
    }

    @TestCase
    public func testCustomChineseDictionary(): Unit {
        let map: HashMap<Char, Char> = HashMap<Char, Char>([('癥', '症')])
        ChineseHelper.addChineseDictResource(map)
        let res1: String = ChineseHelper.convertToSimplifiedChinese("癥")
        @Assert("症", res1)
    }

    @TestCase
    public func testConvertPolyphonicCharactersToPinyin(): Unit {
        let res1: Array<String> = PinyinHelper.convertToPinyinArray('长', PinyinFormat.WITH_TONE_MARK)
        @Assert(["cháng", "zhǎng"], res1)
    }

    @TestCase
    public func testConvertSimplifiedToPinyinSet(): Unit {
        let res1: Array<String> = PinyinHelper.convertToPinyinArray('嚴', PinyinFormat.WITH_TONE_MARK)
        @Assert(["yán"], res1)
    }

    @TestCase
    public func testConvertUniversalPinyin(): Unit {
        var traditionalPinyin: Array<String> = PinyinHelper.toTongyongPinyinStringArray('傳')
        var simplePinyin: Array<String> = PinyinHelper.toTongyongPinyinStringArray('传')
        @Assert(["chuan2", "jhuan4"], traditionalPinyin)
        @Assert(["chuan2", "jhuan4"], simplePinyin)
    }
}
