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
        var arr: Array<Char> = ['棲', '薺', '啟', '豈', '棄', '訖', '韆', '籤', '僉', '纖', '蹌', '竅', '竊', '瓊', '覷', '麯', '闋', '闕']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray)
        @Assert(["qī", "jì", "qí", "qǐ", "qǐ", "kǎi", "qì", "qì", "qiān", "qiān", "qiān", "xiān", "qiāng", "qiào", "qiè", "qióng", "qù", "qū", "qū", "què", "què", "quē"], pinyinArray.toArray())
    }

    @TestCase
    public func test2(): Unit {
        var arr: Array<Char> = ['盤', '蹣', '龐', '紕', '闢', '駢', '嬪', '蘋', '憑', '潑', '僕']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["pán", "pán", "páng", "pī", "pí", "bǐ", "pì", "pián", "pín", "pín", "píng", "píng", "pō", "pú"], pinyinArray.toArray())
    }

    @TestCase
    public func test3(): Unit {
        var arr: Array<Char> = ['難', '撓', '腦', '餒', '輦', '嫋', '聶', '齧', '擰', '農', '駑', '漚', '慪']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["nán", "nàn", "nuó", "náo", "nǎo", "něi", "niǎn", "niǎo", "niè", "niè", "níng", "nǐng", "nìng", "nóng", "nú", "òu", "ōu", "òu"], pinyinArray.toArray())
    }

    @TestCase
    public func test4(): Unit {
        var arr: Array<Char> = ['邁', '麥', '賣', '黴', '懣', '黽', '獼', '麵', '滅', '衊', '畝', '驀']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["mài", "mài", "mài", "méi", "mèn", "mǐn", "miǎn", "měng", "mí", "miàn", "miè", "miè", "mǔ", "mò"], pinyinArray.toArray())
    }

    @TestCase
    public func test5(): Unit {
        var arr: Array<Char> = ['臘', '蠟', '攔', '覽', '欖', '纍', '淚', '籬', '曆', '褳', '斂', '練', '殮', '臨', '廬', '掄', '圇']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["là", "là", "lán", "lǎn", "lǎn", "léi", "lèi", "lí", "lì", "lián", "liǎn", "liàn", "liàn", "lín", "lú", "lūn", "lún", "lún"], pinyinArray.toArray())
    }

    @TestCase
    public func test6(): Unit {
        var arr: Array<Char> = ['墾', '懇', '摳', '噲', '寬', '壙', '曠', '礦', '虧', '巋', '擴']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["kěn", "kěn", "kōu", "kuài", "kuān", "kuàng", "kuàng", "kuàng", "kuī", "kuī", "kuò"], pinyinArray.toArray())
    }

    @TestCase
    public func test7(): Unit {
        var arr: Array<Char> = ['擊', '霽', '傢', '儉', '瞼', '餞', '癤', '傑', '儘', '驚', '剄', '鬮', '舊', '懼', '钁']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["jī", "jì", "jiā", "jiǎn", "jiǎn", "jiàn", "jiē", "jié", "jǐn", "jīng", "jǐng", "jiū", "jiù", "jù", "jué"], pinyinArray.toArray())
    }
}