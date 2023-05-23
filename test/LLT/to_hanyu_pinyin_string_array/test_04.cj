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
    TestHanYufanti.combinationFormatTest8()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func combinationFormatTest1(): Unit {
        var arr: Array<Char> = ['韓', '閡', '轟', '鬍', '華', '劃', '揮', '迴', '匯', '彙', '諱', '穢', '獲', '穫', '懷']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray)
        @Assert(["hán", "hé", "hōng", "hú", "huá", "huà", "huā", "huà", "huá", "huī", "huí", "huì", "huì", "huì", "huì", "huò", "huò", "huái"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest2(): Unit {
        var arr: Array<Char> = ['賅', '蓋', '岡', '崗', '戇', '龔', '鞏', '溝', '構', '穀', '颳', '龜', '軌', '蟈', '過']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["gāi", "gài", "gĕ", "hé", "gāng", "găng", "gāng", "zhuàng", "gōng", "gŏng", "gōu", "gòu", "gŭ", "guā", "guī", "jūn", "qiū", "guĭ", "guō", "guò", "guō"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest3(): Unit {
        var arr: Array<Char> = ['髮', '罰', '範', '廢', '奮', '豐', '膚', '麩', '鳧', '撫', '輔', '訃', '賻', '撫', '繋']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["fà", "fă", "fá", "fàn", "fèi", "fèn", "fēng", "fū", "fū", "fú", "fŭ", "fŭ", "fù", "fù", "fŭ", "xì", "jì"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest4(): Unit {
        var arr: Array<Char> = ['訛', '鵝', '軛', '噁', '諤', '鱷', '爾', '邇', '餌', '貳']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["é", "é", "è", "wù", "è", "è", "ĕr", "ĕr", "ĕr", "èr"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest5(): Unit {
        var arr: Array<Char> = ['噠', '噹', '黨', '導', '禱', '遞', '澱', '鼕', '凍', '瀆', '牘', '黷', '噸', '奪', '鐸', '闘']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["dā", "dāng", "dăng", "dăo", "dào", "dăo", "dì", "diàn", "dōng", "dòng", "dú", "dú", "dú", "dūn", "dùn", "duó", "duó", "dòu", "dŏu"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest6(): Unit {
        var arr: Array<Char> = ['纔', '蠶', '倉', '層', '攙', '腸', '倀', '塵', '稱', '蟶', '乗', '齒', '寵', '籌', '躊', '齣', '芻', '鶉', '叢']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["cái", "cán", "cāng", "céng", "chān", "cháng", "chāng", "chén", "chēng", "chèn", "chèng", "chēng", "chéng", "shèng", "chĭ", "chŏng", "chóu", "chóu", "chū", "chú", "chún", "cóng"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest7(): Unit {
        var arr: Array<Char> = ['壩', '擺', '鴇', '狽', '備', '輩', '憊', '幣', '變', '彆', '鱉', '癟', '賓', '濱', '繽', '檳', '臏', '撥', '駁', '補']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["bà", "băi", "băo", "bèi", "bèi", "bèi", "bèi", "bì", "biàn", "biè", "biē", "biē", "biĕ", "bīn", "bīn", "bīn", "bīn", "bīng", "bìn", "bō", "bó", "bŭ"], pinyinArray.toArray())
    }

    @TestCase
    public func combinationFormatTest8(): Unit {
        var arr: Array<Char> = ['皚', '藹', '靄', '礙', '闇', '襖', '鼇', '襖']
        let defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
        defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
        defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat))
        }
        //println(pinyinArray.toArray())
        @Assert(["ái", "ăi", "ăi", "ài", "àn", "ăo", "áo", "ăo"], pinyinArray.toArray())
    }
}