// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.unittest.*
import std.unittest.testmacro.*


main() {
    let testPinyinHelper = TestPinyinHelper()
    testPinyinHelper.test1()
    testPinyinHelper.test2()
    testPinyinHelper.test3()
    testPinyinHelper.test4()
    return 0
}

@Test
public class TestPinyinHelper {
    @TestCase
    public func test1(): Unit {
        let s1: String = "河南麥收季遇10年最嚴重“爛場雨”，灾情如何？怎樣應對？"
        let res1: String = PinyinHelper.convertToPinyinStringTraditional(s1, " ", PinyinFormat.WITH_TONE_MARK)
        @Assert("hé nán mài shōu jì yù 10 nián zuì yán zhòng “ làn chǎng yǔ ”， zāi qíng rú hé ？ zěn yàng yīng duì ？", res1)
    }

    @TestCase
    public func test2(): Unit {
        let s1: String = "河南麥收季遇10年最嚴重“爛場雨”，灾情如何？怎樣應對？"
        let res1: String = PinyinHelper.convertToPinyinStringTraditional(s1, " ", PinyinFormat.WITHOUT_TONE)
        @Assert("he nan mai shou ji yu 10 nian zui yan zhong “ lan chang yu ”， zai qing ru he ？ zen yang ying dui ？", res1)
    }

    @TestCase
    public func test3(): Unit {
        let s1: String = "河南麥收季遇10年最嚴重“爛場雨”，灾情如何？怎樣應對？"
        let res1: String = PinyinHelper.convertToPinyinStringTraditional(s1, " ", PinyinFormat.WITH_TONE_NUMBER)
        @Assert("he2 nan2 mai4 shou1 ji4 yu4 10 nian2 zui4 yan2 zhong4 “ lan4 chang3 yu3 ”， zai1 qing2 ru2 he2 ？ zen3 yang4 ying1 dui4 ？", res1)
    }

    @TestCase
    public func test4(): Unit {
        let s1: String = "河南麥收季遇10年最嚴重“爛場雨”，灾情如何？怎樣應對？"
        let res1: String = PinyinHelper.convertToPinyinStringTraditional(s1, " ", PinyinFormat.FIRST_LETTER)
        @Assert("h n m s j y 10 n z y z “ l c y ”， z q r h ？ z y y d ？", res1)
    }
}
