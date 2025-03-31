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
        var arr: Array<Rune> = [r'棲', r'薺', r'啟', r'豈', r'棄', r'訖', r'韆', r'籤', r'僉', r'纖', r'蹌', r'竅', r'竊', r'瓊', r'覷', r'麯', r'闋', r'闕']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray)
        @Assert(["qī", "jì", "qí", "qǐ", "qǐ", "kǎi", "qì", "qì", "qiān", "qiān", "qiān", "xiān", "qiāng", "qiào", "qiè", "qióng", "qù", "qū", "qū", "què", "què", "quē"], pinyinArray.toArray())
    }

    @TestCase
    public func test2(): Unit {
        var arr: Array<Rune> = [r'盤', r'蹣', r'龐', r'紕', r'闢', r'駢', r'嬪', r'蘋', r'憑', r'潑', r'僕']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["pán", "pán", "páng", "pī", "pí", "bǐ", "pì", "pián", "pín", "pín", "píng", "píng", "pō", "pú"], pinyinArray.toArray())
    }

    @TestCase
    public func test3(): Unit {
        var arr: Array<Rune> = [r'難', r'撓', r'腦', r'餒', r'輦', r'嫋', r'聶', r'齧', r'擰', r'農', r'駑', r'漚', r'慪']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["nán", "nàn", "nuó", "náo", "nǎo", "něi", "niǎn", "niǎo", "niè", "niè", "níng", "nǐng", "nìng", "nóng", "nú", "òu", "ōu", "òu"], pinyinArray.toArray())
    }

    @TestCase
    public func test4(): Unit {
        var arr: Array<Rune> = [r'邁', r'麥', r'賣', r'黴', r'懣', r'黽', r'獼', r'麵', r'滅', r'衊', r'畝', r'驀']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["mài", "mài", "mài", "méi", "mèn", "mǐn", "miǎn", "měng", "mí", "miàn", "miè", "miè", "mǔ", "mò"], pinyinArray.toArray())
    }

    @TestCase
    public func test5(): Unit {
        var arr: Array<Rune> = [r'臘', r'蠟', r'攔', r'覽', r'欖', r'纍', r'淚', r'籬', r'曆', r'褳', r'斂', r'練', r'殮', r'臨', r'廬', r'掄', r'圇']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["là", "là", "lán", "lǎn", "lǎn", "léi", "lèi", "lí", "lì", "lián", "liǎn", "liàn", "liàn", "lín", "lú", "lūn", "lún", "lún"], pinyinArray.toArray())
    }

    @TestCase
    public func test6(): Unit {
        var arr: Array<Rune> = [r'墾', r'懇', r'摳', r'噲', r'寬', r'壙', r'曠', r'礦', r'虧', r'巋', r'擴']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["kěn", "kěn", "kōu", "kuài", "kuān", "kuàng", "kuàng", "kuàng", "kuī", "kuī", "kuò"], pinyinArray.toArray())
    }

    @TestCase
    public func test7(): Unit {
        var arr: Array<Rune> = [r'擊', r'霽', r'傢', r'儉', r'瞼', r'餞', r'癤', r'傑', r'儘', r'驚', r'剄', r'鬮', r'舊', r'懼', r'钁']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["jī", "jì", "jiā", "jiǎn", "jiǎn", "jiàn", "jiē", "jié", "jǐn", "jīng", "jǐng", "jiū", "jiù", "jù", "jué"], pinyinArray.toArray())
    }
}