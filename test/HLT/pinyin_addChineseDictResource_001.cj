//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*

@Test
public class pinyin_addChineseDictResource_001 {
    @TestCase
    public func pinyin_addChineseDictResource_001():Unit{
        
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

        var str = ChineseHelper.convertToSimplifiedChinese("鬍")
        println("str = ${str}")
        @Assert("鬍", ChineseHelper.convertToSimplifiedChinese("鬍"))
        ChineseHelper.addChineseDictResource(chinese_dict)
        str = ChineseHelper.convertToSimplifiedChinese("鬍")
        println("str = ${str}")
        @Assert("胡", ChineseHelper.convertToSimplifiedChinese("鬍"))
    }
}