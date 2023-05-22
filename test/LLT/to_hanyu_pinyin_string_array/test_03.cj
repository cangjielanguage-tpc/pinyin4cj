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
        var arr: Array<Char> = ['棲', '薺', '啟', '豈', '棄', '訖', '韆', '籤', '僉', '纖', '蹌', '竅', '竊', '瓊', '覷', '麯', '闋', '闕']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray)
        @Assert(["qī", "xī", "qí", "jì", "qĭ", "qĭ", "kăi", "qì", "qì", "qiān", "qiān", "qiān", "xiān", "qiāng", "qiàng", "qiào", "qiè", "qióng", "qù", "qū", "qū", "qŭ", "què", "què", "quē"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest2(): Unit {
        var arr: Array<Char> = ['盤', '蹣', '龐', '紕', '闢', '駢', '嬪', '蘋', '憑', '潑', '僕']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["pán", "mán", "pán", "páng", "pí", "pī", "pì", "bì", "pī", "pián", "pín", "pín", "píng", "píng", "pō", "pú", "pū"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest3(): Unit {
        var arr: Array<Char> = ['難', '撓', '腦', '餒', '輦', '嫋', '聶', '齧', '擰', '農', '駑', '漚', '慪']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["nán", "nàn", "náo", "năo", "nĕi", "niăn", "niăo", "niè", "niè", "nĭng", "níng", "nóng", "nú", "òu", "ōu", "òu", "ōu"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest4(): Unit {
        var arr: Array<Char> = ['邁', '麥', '賣', '黴', '懣', '黽', '獼', '麵', '滅', '衊', '畝', '驀']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["mài", "mài", "mài", "méi", "mèn", "mĭn", "miăn", "mí", "miàn", "miè", "miè", "mŭ", "mò"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest5(): Unit {
        var arr: Array<Char> = ['臘', '蠟', '攔', '覽', '欖', '纍', '淚', '籬', '曆', '褳', '斂', '練', '殮', '臨', '廬', '掄', '圇']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["là", "xī", "là", "zhà", "lán", "lăn", "lăn", "léi", "lèi", "lí", "lì", "lián", "liàn", "liăn", "liàn", "liàn", "lín", "lú", "lún", "lūn", "lún"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest6(): Unit {
        var arr: Array<Char> = ['墾', '懇', '摳', '噲', '寬', '壙', '曠', '礦', '虧', '巋', '擴']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["kĕn", "kĕn", "kōu", "kuài", "kuān", "kuàng", "kuàng", "kuàng", "gŏng", "kuī", "kuī", "kuò"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest7(): Unit {
        var arr: Array<Char> = ['擊', '霽', '傢', '儉', '瞼', '餞', '癤', '傑', '儘', '驚', '剄', '鬮', '舊', '懼', '钁']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["jí", "jī", "jì", "jiā", "jiăn", "jiăn", "jiàn", "jiē", "jié", "jĭn", "jìn", "jīng", "jĭng", "jiū", "jiù", "jù", "jué"], pinyinArray.toArray())
    }
}