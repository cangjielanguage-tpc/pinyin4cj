// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

let chinese_dict: HashMap<Char, Char> = HashMap<Char, Char>([
    ('鬍', '胡'),
    ('迴', '回'),
    ('匯', '汇'),
    ('穫', '获'),
    ('颳', '刮'),
    ('髮', '发'),
    ('繋', '系'),
    ('噁', '恶'),
    ('噹', '当'),
    ('鼕', '冬'),
    ('闘', '门'),
    ('纔', '才'),
    ('乗', '乘'),
    ('齣', '出'),
    ('闇', '暗')
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