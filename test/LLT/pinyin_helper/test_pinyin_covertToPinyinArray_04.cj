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
    TestHanYufanti.test8()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func test1(): Unit {
        var arr: Array<Rune> = [r'韓', r'閡', r'轟', r'鬍', r'華', r'劃', r'揮', r'迴', r'匯', r'彙', r'諱', r'穢', r'獲', r'穫', r'懷']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray)
        @Assert(["hán", "hé", "hōng", "hú", "huá", "huà", "huā", "huá", "huà", "huī", "huí", "huì", "huì", "huì", "huì", "huò", "huò", "huái"], pinyinArray.toArray())
    }

    @TestCase
    public func test2(): Unit {
        var arr: Array<Rune> = [r'賅', r'蓋', r'岡', r'崗', r'戇', r'龔', r'鞏', r'溝', r'構', r'穀', r'颳', r'龜', r'軌', r'蟈', r'過']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["gāi", "gài", "gě", "hé", "gāng", "gǎng", "gāng", "gàng", "zhuàng", "gōng", "gǒng", "gōu", "gòu", "gǔ", "guā", "guī", "jūn", "qiū", "guǐ", "guō", "guò"], pinyinArray.toArray())
    }

    @TestCase
    public func test3(): Unit {
        var arr: Array<Rune> = [r'髮', r'罰', r'範', r'廢', r'奮', r'豐', r'膚', r'麩', r'鳧', r'撫', r'輔', r'訃', r'賻', r'撫', r'繋']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["fà", "fá", "fàn", "fèi", "fèn", "fēng", "fū", "fū", "fú", "fǔ", "fǔ", "fù", "fù", "fǔ", "jì"], pinyinArray.toArray())
    }

    @TestCase
    public func test4(): Unit {
        var arr: Array<Rune> = [r'訛', r'鵝', r'軛', r'噁', r'諤', r'鱷', r'爾', r'邇', r'餌', r'貳']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["é", "é", "è", "ě", "è", "è", "ěr", "ěr", "ěr", "èr"], pinyinArray.toArray())
    }

    @TestCase
    public func test5(): Unit {
        var arr: Array<Rune> = [r'噠', r'噹', r'黨', r'導', r'禱', r'遞', r'澱', r'鼕', r'凍', r'瀆', r'牘', r'黷', r'噸', r'奪', r'鐸', r'闘']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["dā", "dāng", "dǎng", "dǎo", "dǎo", "dì", "diàn", "dōng", "dòng", "dú", "dòu", "dú", "dú", "dūn", "duó", "duó", "dòu"], pinyinArray.toArray())
    }

    @TestCase
    public func test6(): Unit {
        var arr: Array<Rune> = [r'纔', r'蠶', r'倉', r'層', r'攙', r'腸', r'倀', r'塵', r'稱', r'蟶', r'乗', r'齒', r'寵', r'籌', r'躊', r'齣', r'芻', r'鶉', r'叢']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["cái", "cán", "cāng", "céng", "chān", "cháng", "chāng", "chén", "chēng", "chèn", "chèng", "chēng", "chéng", "shèng", "chǐ", "chǒng", "chóu", "chóu", "chū", "chú", "chún", "cóng"], pinyinArray.toArray())
    }

    @TestCase
    public func test7(): Unit {
        var arr: Array<Rune> = [r'壩', r'擺', r'鴇', r'狽', r'備', r'輩', r'憊', r'幣', r'變', r'彆', r'鱉', r'癟', r'賓', r'濱', r'繽', r'檳', r'臏', r'撥', r'駁', r'補']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["bà", "bǎi", "bǎo", "bèi", "bèi", "bèi", "bèi", "bì", "biàn", "biè", "biē", "biē", "biě", "bīn", "bīn", "bīn", "bīn", "bīng", "bìn", "bō", "bó", "bǔ"], pinyinArray.toArray())
    }

    @TestCase
    public func test8(): Unit {
        var arr: Array<Rune> = [r'皚', r'藹', r'靄', r'礙', r'闇', r'襖', r'鼇', r'襖']
        let pinyinArray: ArrayList<String> = ArrayList<String>(arr.size*5)
        for( i in 0..arr.size) {
            pinyinArray.appendAll(PinyinHelper.convertToPinyinArray(arr[i], PinyinFormat.WITH_TONE_MARK))
        }
        //println(pinyinArray.toArray())
        @Assert(["ái", "ǎi", "ǎi", "ài", "àn", "ǎo", "áo", "ǎo"], pinyinArray.toArray())
    }
}