// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.unittest.*
import std.unittest.testmacro.*


main() {
    let testChineseHelper = TestChineseHelper()
    testChineseHelper.test1()
    testChineseHelper.test2()
    testChineseHelper.test3()
    testChineseHelper.test4()
    testChineseHelper.test5()
    return 0
}

@Test
public class TestChineseHelper {

    @TestCase
    public func test1(): Unit {
        @Assert("台丧丽", ChineseHelper.convertToSimplifiedChinese("臺喪麗"))  
    }

    @TestCase
    public func test2(): Unit {
        @Assert("臺喪麗", ChineseHelper.convertToTraditionalChinese("台丧丽"))
    }

    @TestCase
    public func test3(): Unit {
        @Assert(true, ChineseHelper.isChinese(r'台'))
        @Assert(false, ChineseHelper.isChinese(r'3'))
        @Assert(false, ChineseHelper.isChinese(r'J'))
        @Assert(false, ChineseHelper.isChinese(r','))
        @Assert(false, ChineseHelper.isChinese(r'。'))
    }

    @TestCase
    public func test4(): Unit {
        @Assert(true, ChineseHelper.containsChinese("12台丧丽"))
        @Assert(false, ChineseHelper.containsChinese("123"))
        @Assert(false, ChineseHelper.containsChinese("，。-"))

    }

    @TestCase
    public func test5(): Unit {
        @Assert(true, ChineseHelper.isTraditionalChinese(r'臺'))
        @Assert(false, ChineseHelper.isTraditionalChinese(r'癥'))
        @Assert(false, ChineseHelper.isTraditionalChinese(r'台'))
    }
}