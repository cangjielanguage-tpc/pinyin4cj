// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {    
    let TestHanYufanti = TestHanYufanti()
    TestHanYufanti.combinationFormatTest1()
    TestHanYufanti.combinationFormatTest2()
    TestHanYufanti.combinationFormatTest3()
    TestHanYufanti.combinationFormatTest4()
    TestHanYufanti.combinationFormatTest5()
    TestHanYufanti.combinationFormatTest6()
    TestHanYufanti.combinationFormatTest7()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func combinationFormatTest1(): Unit {
        var arr: Array<Char> = ['雜', '災', '鍘', '氈', '戰', '癥', '鄭', '織', '幟', '製', '質', '緻', '擲', '眾', '謅', '縐', '貯', '鑄', '鄒', '鑽']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        @Assert(["zá", "zāi", "zhá", "zhān", "zhàn", "zhēng", "zhèng", "zhèng", "zhī", "zhì", "zhì", "zhí", "zhì", "zhì", "zhì", "zhí", "zhòng", "zōu", "zhōu", "zhòu", "zhŭ", "zhù", "zhù", "zōu", "zuàn", "zuān", "zuăn"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest2(): Unit {
        var arr: Array<Char> = ['壓', '嚴', '鹽', '儼', '豔','贗', '鑰', '異', '囈', '繹', '癰', '嶼', '嫗', '鬱', '嶽']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        println(pinyinArray.toArray())
        @Assert(["yā", "yà", "yán", "yán", "yăn", "yàn", "yàn", "yào", "yuè", "yì", "yì", "yì", "yōng", "yŭ", "yù", "yù", "yuè"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest3(): Unit {
        var arr: Array<Char> = ['犧', '習', '襲', '璽', '癇', '顯', '憲', '鄉', '嚮', '脅', '籲', '續', '懸', '遜']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        println(pinyinArray.toArray())
        @Assert(["xī", "xí", "xí", "xĭ", "xián", "xiăn", "xiàn", "xiāng", "xiàng", "xié", "xū", "yū", "yù", "xù", "xuán", "xùn"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest4(): Unit {
        var arr: Array<Char> = ['窪', '媧', '襪', '彎', '違', '葦', '衛', '窩', '蝸', '蕪', '騖']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        println(pinyinArray.toArray())
        @Assert(["wā", "wā", "wà", "wān", "wéi", "wĕi", "wèi", "wō", "guā", "wō", "wú", "wù"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest5(): Unit {
        var arr: Array<Char> = ['撻', '檯', '灘', '罎', '體', '鐵', '廳', '聽', '慟', '糰', '飩', '馱']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        println(pinyinArray.toArray())
        @Assert(["tà", "tái", "tān", "tán", "tĭ", "tiĕ", "tīng", "tīng", "tìng", "tòng", "tuán", "tun", "tún", "tuó", "duò"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest6(): Unit {
        var arr: Array<Char> = ['灑', '薩', '傘', '澀', '曬', '瀋', '濕', '屬', '閂', '絲', '囌', '雙']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        println(pinyinArray.toArray())
        @Assert(["să", "sà", "săn", "sè", "shài", "shĕn", "shī", "shŭ", "zhŭ", "shuān", "sī", "sū", "shuāng"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest7(): Unit {
        var arr: Array<Char> = ['讓', '饒', '嬈', '擾', '繞', '紉', '韌', '縟', '閏']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        println(pinyinArray.toArray())
        @Assert(["ràng", "ráo", "răo", "ráo", "răo", "rào", "răo", "rèn", "rèn", "rù", "rùn"], pinyinArray.toArray())
    }
}