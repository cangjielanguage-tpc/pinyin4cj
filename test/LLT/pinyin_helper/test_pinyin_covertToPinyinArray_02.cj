// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*


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
        var arr: Array<Rune> = [r'雜', r'災', r'鍘', r'氈', r'戰', r'癥', r'鄭', r'織', r'幟', r'製', r'質', r'緻', r'擲', r'眾', r'謅', r'縐', r'貯', r'鑄', r'鄒', r'鑽']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray)
        @Assert(["zá", "zāi", "zhá", "zhān", "zhàn", "zhēng", "zhèng", "zhī", "zhì", "zhì", "zhì", "zhì", "zhì", "zhì", "zhòng", "zhōu", "zhòu", "zhù", "zhù", "zōu", "zuān"], pinyinArray.toArray())
    }

    @TestCase
    public func test2(): Unit {
        var arr: Array<Rune> = [r'壓', r'嚴', r'鹽', r'儼', r'豔', r'贗', r'鑰', r'異', r'囈', r'繹', r'癰', r'嶼', r'嫗', r'鬱', r'嶽']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert( ["yā", "yà", "yán", "yán", "yǎn", "yàn", "yàn", "yuè", "yì", "yì", "yì", "yōng", "yǔ", "yù", "yù", "yuè"], pinyinArray.toArray())
    }

    @TestCase
    public func test3(): Unit {
        var arr: Array<Rune> = [r'犧', r'習', r'襲', r'璽', r'癇', r'顯', r'憲', r'鄉', r'嚮', r'脅', r'籲', r'續', r'懸', r'遜']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["xī", "xí", "xí", "xǐ", "xián", "xiǎn", "xiàn", "xiāng", "xiàng", "xié", "yù", "xù", "xuán", "xùn"], pinyinArray.toArray())
    }

    @TestCase
    public func test4(): Unit {
        var arr: Array<Rune> = [r'窪', r'媧', r'襪', r'彎', r'違', r'葦', r'衛', r'窩', r'蝸', r'蕪', r'騖']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["wā", "wā", "wà", "wān", "wéi", "wěi", "wèi", "wō", "wō", "wú", "wù"], pinyinArray.toArray())
    }

    @TestCase
    public func test5(): Unit {
        var arr: Array<Rune> = [r'撻', r'檯', r'灘', r'罎', r'體', r'鐵', r'廳', r'聽', r'慟', r'糰', r'飩', r'馱']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["tà", "tái", "tān", "tán", "tǐ", "tī", "tiě", "tīng", "tīng", "tòng", "tuán", "tún", "tuó", "duò"], pinyinArray.toArray())
    }

    @TestCase
    public func test6(): Unit {
        var arr: Array<Rune> = [r'灑', r'薩', r'傘', r'澀', r'曬', r'瀋', r'濕', r'屬', r'閂', r'絲', r'囌', r'雙']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["sǎ", "sà", "sǎn", "sè", "shài", "shěn", "shī", "shǔ", "zhǔ", "shuān", "sī", "sū", "shuāng"], pinyinArray.toArray())
    }

    @TestCase
    public func test7(): Unit {
        var arr: Array<Rune> = [r'讓', r'饒', r'嬈', r'擾', r'繞', r'紉', r'韌', r'縟', r'閏']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["ràng", "ráo", "ráo", "rǎo", "rǎo", "rào", "rèn", "rèn", "rù", "rùn"], pinyinArray.toArray())
    }
}