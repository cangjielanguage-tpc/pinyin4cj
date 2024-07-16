// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.unittest.*
import std.unittest.testmacro.*


main() {
    let testChineseHelper = TestChineseHelper()
    testChineseHelper.test1()
    return 0
}

@Test
public class TestChineseHelper {

    @TestCase
    public func test1(): Unit {
        @Assert("我們是中國共產主義接班人", ChineseHelper.convertToTraditionalChinese("我们是中国共产主义接班人"))  
    }

}