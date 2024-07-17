// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.unittest.*
import std.unittest.testmacro.*


main() {
    let testPinyinHelper = TestPinyinHelper()
    testPinyinHelper.test1()
    return 0
}
@Test
public class TestPinyinHelper {
    @TestCase
    public func test1(): Unit {
        @Assert(true, PinyinHelper.hasMultiPinyin(r'长'))
        @Assert(true, PinyinHelper.hasMultiPinyin(r'大'))
        @Assert(true, PinyinHelper.hasMultiPinyin(r'阿'))
        @Assert(false, PinyinHelper.hasMultiPinyin(r'你'))
    }

}
