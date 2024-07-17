// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*


main() {
    let testChineseHelper = TestChineseHelper()
    testChineseHelper.test1()
    testChineseHelper.test2()
    return 0
}

@Test
public class TestChineseHelper {
    @TestCase
    public func test1(): Unit {
        let map: HashMap<Rune, Rune> = HashMap<Rune, Rune>([(r'癥', r'症'), (r'臺', r'一')])
        ChineseHelper.addChineseDictResource(map)
        @Assert("症", ChineseHelper.convertToSimplifiedChinese("癥"))
        @Assert("一", ChineseHelper.convertToSimplifiedChinese("臺"))
    }

    @TestCase
    public func test2(): Unit {
        let str: String = "臺喪麗"
        let data: Array<Byte> = unsafe { str.rawData() }
        let sb = StringBuilder(str.size)
        var i: Int64 = 0
        while (i < str.size) {
            var (r, utf8Size) = Rune.fromUtf8(data, i)
            i += utf8Size
            sb.append(r)
        }
        @Assert("臺喪麗", sb.toString())
    }
}
