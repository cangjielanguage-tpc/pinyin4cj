// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let testChineseHelper = TestChineseHelper()
    testChineseHelper.test1()
    return 0
}

@Test
public class TestChineseHelper {
    @TestCase
    public func test1(): Unit {

        @Assert("台丧丽", ChineseHelper.convertToSimplifiedChinese("臺喪麗"))

        @Assert("臺喪麗", ChineseHelper.convertToTraditionalChinese("台丧丽"))

        @Assert(true, ChineseHelper.isChinese('台'))

        @Assert(false, ChineseHelper.isChinese('3'))

        @Assert(false, ChineseHelper.isChinese('J'))

        @Assert(true, ChineseHelper.containsChinese("12台丧丽"))

        @Assert(false, ChineseHelper.containsChinese("123"))

        @Assert(true, ChineseHelper.isTraditionalChinese('臺'))

        @Assert(false, ChineseHelper.isTraditionalChinese('台'))

    }

  
}