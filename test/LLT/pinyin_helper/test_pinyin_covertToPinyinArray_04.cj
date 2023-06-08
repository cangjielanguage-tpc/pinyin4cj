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
    TestHanYufanti.test8()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func test1(): Unit {
        var arr: Array<Char> = ['韓', '閡', '轟', '鬍', '華', '劃', '揮', '迴', '匯', '彙', '諱', '穢', '獲', '穫', '懷']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray)
        @Assert(["hán", "hé", "hōng", "hú", "huá", "huà", "huā", "huá", "huà", "huī", "huí", "huì", "huì", "huì", "huì", "huò", "huò", "huái"], pinyinArray.toArray())
    }

    @TestCase
    public func test2(): Unit {
        var arr: Array<Char> = ['賅', '蓋', '岡', '崗', '戇', '龔', '鞏', '溝', '構', '穀', '颳', '龜', '軌', '蟈', '過']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["gāi", "gài", "gě", "hé", "gāng", "gǎng", "gāng", "gàng", "zhuàng", "gōng", "gǒng", "gōu", "gòu", "gǔ", "guā", "guī", "jūn", "qiū", "guǐ", "guō", "guò"], pinyinArray.toArray())
    }

    @TestCase
    public func test3(): Unit {
        var arr: Array<Char> = ['髮', '罰', '範', '廢', '奮', '豐', '膚', '麩', '鳧', '撫', '輔', '訃', '賻', '撫', '繋']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["fà", "fá", "fàn", "fèi", "fèn", "fēng", "fū", "fū", "fú", "fǔ", "fǔ", "fù", "fù", "fǔ", "jì"], pinyinArray.toArray())
    }

    @TestCase
    public func test4(): Unit {
        var arr: Array<Char> = ['訛', '鵝', '軛', '噁', '諤', '鱷', '爾', '邇', '餌', '貳']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["é", "é", "è", "ě", "è", "è", "ěr", "ěr", "ěr", "èr"], pinyinArray.toArray())
    }

    @TestCase
    public func test5(): Unit {
        var arr: Array<Char> = ['噠', '噹', '黨', '導', '禱', '遞', '澱', '鼕', '凍', '瀆', '牘', '黷', '噸', '奪', '鐸', '闘']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["dā", "dāng", "dǎng", "dǎo", "dǎo", "dì", "diàn", "dōng", "dòng", "dú", "dòu", "dú", "dú", "dūn", "duó", "duó", "dòu"], pinyinArray.toArray())
    }

    @TestCase
    public func test6(): Unit {
        var arr: Array<Char> = ['纔', '蠶', '倉', '層', '攙', '腸', '倀', '塵', '稱', '蟶', '乗', '齒', '寵', '籌', '躊', '齣', '芻', '鶉', '叢']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["cái", "cán", "cāng", "céng", "chān", "cháng", "chāng", "chén", "chēng", "chèn", "chèng", "chēng", "chéng", "shèng", "chǐ", "chǒng", "chóu", "chóu", "chū", "chú", "chún", "cóng"], pinyinArray.toArray())
    }

    @TestCase
    public func test7(): Unit {
        var arr: Array<Char> = ['壩', '擺', '鴇', '狽', '備', '輩', '憊', '幣', '變', '彆', '鱉', '癟', '賓', '濱', '繽', '檳', '臏', '撥', '駁', '補']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["bà", "bǎi", "bǎo", "bèi", "bèi", "bèi", "bèi", "bì", "biàn", "biè", "biē", "biē", "biě", "bīn", "bīn", "bīn", "bīn", "bīng", "bìn", "bō", "bó", "bǔ"], pinyinArray.toArray())
    }

    @TestCase
    public func test8(): Unit {
        var arr: Array<Char> = ['皚', '藹', '靄', '礙', '闇', '襖', '鼇', '襖']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["ái", "ǎi", "ǎi", "ài", "àn", "ǎo", "áo", "ǎo"], pinyinArray.toArray())
    }
}