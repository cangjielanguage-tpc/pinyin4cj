// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*


let chinese_dict: HashMap<Rune, Rune> = HashMap<Rune, Rune>([
    (r'鬍', r'胡'),
    (r'迴', r'回'),
    (r'匯', r'汇'),
    (r'穫', r'获'),
    (r'颳', r'刮'),
    (r'髮', r'发'),
    (r'繋', r'系'),
    (r'噁', r'恶'),
    (r'噹', r'当'),
    (r'鼕', r'冬'),
    (r'闘', r'门'),
    (r'纔', r'才'),
    (r'乗', r'乘'),
    (r'齣', r'出'),
    (r'闇', r'暗')
])

main() {
    let testChineseHelper = TestChineseHelper()
    testChineseHelper.test1()
    testChineseHelper.test2()
    return 0
}

@Test
public class TestChineseHelper {
    @TestCase
    public func test1(): Unit {
        @Assert("鬍", ChineseHelper.convertToSimplifiedChinese("鬍"))
        @Assert("迴", ChineseHelper.convertToSimplifiedChinese("迴"))
        @Assert("匯", ChineseHelper.convertToSimplifiedChinese("匯"))
        @Assert("穫", ChineseHelper.convertToSimplifiedChinese("穫"))
        @Assert("颳", ChineseHelper.convertToSimplifiedChinese("颳"))
        @Assert("髮", ChineseHelper.convertToSimplifiedChinese("髮"))
        @Assert("繋", ChineseHelper.convertToSimplifiedChinese("繋"))
        @Assert("噁", ChineseHelper.convertToSimplifiedChinese("噁"))
        @Assert("噹", ChineseHelper.convertToSimplifiedChinese("噹"))
        @Assert("鼕", ChineseHelper.convertToSimplifiedChinese("鼕"))
        @Assert("闘", ChineseHelper.convertToSimplifiedChinese("闘"))
        @Assert("纔", ChineseHelper.convertToSimplifiedChinese("纔"))
        @Assert("乗", ChineseHelper.convertToSimplifiedChinese("乗"))
        @Assert("齣", ChineseHelper.convertToSimplifiedChinese("齣"))
        @Assert("闇", ChineseHelper.convertToSimplifiedChinese("闇"))

    }

    @TestCase
    public func test2(): Unit {
        ChineseHelper.addChineseDictResource(chinese_dict)
        @Assert("胡", ChineseHelper.convertToSimplifiedChinese("鬍"))
        @Assert("回", ChineseHelper.convertToSimplifiedChinese("迴"))
        @Assert("汇", ChineseHelper.convertToSimplifiedChinese("匯"))
        @Assert("获", ChineseHelper.convertToSimplifiedChinese("穫"))
        @Assert("刮", ChineseHelper.convertToSimplifiedChinese("颳"))
        @Assert("发", ChineseHelper.convertToSimplifiedChinese("髮"))
        @Assert("系", ChineseHelper.convertToSimplifiedChinese("繋"))
        @Assert("恶", ChineseHelper.convertToSimplifiedChinese("噁"))
        @Assert("当", ChineseHelper.convertToSimplifiedChinese("噹"))
        @Assert("冬", ChineseHelper.convertToSimplifiedChinese("鼕"))
        @Assert("门", ChineseHelper.convertToSimplifiedChinese("闘"))
        @Assert("才", ChineseHelper.convertToSimplifiedChinese("纔"))
        @Assert("乘", ChineseHelper.convertToSimplifiedChinese("乗"))
        @Assert("出", ChineseHelper.convertToSimplifiedChinese("齣"))
        @Assert("暗", ChineseHelper.convertToSimplifiedChinese("闇"))
    }
}