// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {    
    let TestHanYufanti = TestHanYufanti()
    TestHanYufanti.test1()
    TestHanYufanti.test2()
    TestHanYufanti.test3()
    TestHanYufanti.test4()
    TestHanYufanti.test5()
    TestHanYufanti.test6()
    TestHanYufanti.test7()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func test1(): Unit {
        var arr: Array<Char> = ['雜', '災', '鍘', '氈', '戰', '癥', '鄭', '織', '幟', '製', '質', '緻', '擲', '眾', '謅', '縐', '貯', '鑄', '鄒', '鑽']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray)
        @Assert(["zá", "zāi", "zhá", "zhān", "zhàn", "zhēng", "zhèng", "zhī", "zhì", "zhì", "zhì", "zhì", "zhì", "zhì", "zhòng", "zhōu", "zhòu", "zhù", "zhù", "zōu", "zuān"], pinyinArray.toArray())
    }

    @TestCase
    public func test2(): Unit {
        var arr: Array<Char> = ['壓', '嚴', '鹽', '儼', '豔','贗', '鑰', '異', '囈', '繹', '癰', '嶼', '嫗', '鬱', '嶽']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert( ["yā", "yà", "yán", "yán", "yǎn", "yàn", "yàn", "yuè", "yì", "yì", "yì", "yōng", "yǔ", "yù", "yù", "yuè"], pinyinArray.toArray())
    }

    @TestCase
    public func test3(): Unit {
        var arr: Array<Char> = ['犧', '習', '襲', '璽', '癇', '顯', '憲', '鄉', '嚮', '脅', '籲', '續', '懸', '遜']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["xī", "xí", "xí", "xǐ", "xián", "xiǎn", "xiàn", "xiāng", "xiàng", "xié", "yù", "xù", "xuán", "xùn"], pinyinArray.toArray())
    }

    @TestCase
    public func test4(): Unit {
        var arr: Array<Char> = ['窪', '媧', '襪', '彎', '違', '葦', '衛', '窩', '蝸', '蕪', '騖']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["wā", "wā", "wà", "wān", "wéi", "wěi", "wèi", "wō", "wō", "wú", "wù"], pinyinArray.toArray())
    }

    @TestCase
    public func test5(): Unit {
        var arr: Array<Char> = ['撻', '檯', '灘', '罎', '體', '鐵', '廳', '聽', '慟', '糰', '飩', '馱']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["tà", "tái", "tān", "tán", "tǐ", "tī", "tiě", "tīng", "tīng", "tòng", "tuán", "tún", "tuó", "duò"], pinyinArray.toArray())
    }

    @TestCase
    public func test6(): Unit {
        var arr: Array<Char> = ['灑', '薩', '傘', '澀', '曬', '瀋', '濕', '屬', '閂', '絲', '囌', '雙']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["sǎ", "sà", "sǎn", "sè", "shài", "shěn", "shī", "shǔ", "zhǔ", "shuān", "sī", "sū", "shuāng"], pinyinArray.toArray())
    }

    @TestCase
    public func test7(): Unit {
        var arr: Array<Char> = ['讓', '饒', '嬈', '擾', '繞', '紉', '韌', '縟', '閏']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["ràng", "ráo", "ráo", "rǎo", "rǎo", "rào", "rèn", "rèn", "rù", "rùn"], pinyinArray.toArray())
    }
}