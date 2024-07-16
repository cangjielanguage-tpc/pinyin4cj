//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*

@Test
public class pinyin_addChineseDictResource_001 {
    @TestCase
    public func pinyin_addChineseDictResource_001():Unit{
        
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

        var str = ChineseHelper.convertToSimplifiedChinese("鬍")
        println("str = ${str}")
        @Assert("鬍", ChineseHelper.convertToSimplifiedChinese("鬍"))
        ChineseHelper.addChineseDictResource(chinese_dict)
        str = ChineseHelper.convertToSimplifiedChinese("鬍")
        println("str = ${str}")
        @Assert("胡", ChineseHelper.convertToSimplifiedChinese("鬍"))
    }
}