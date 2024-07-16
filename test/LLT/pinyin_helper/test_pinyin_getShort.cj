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
        let s1: String = "了如指掌 we win"
        let res1: String = PinyinHelper.getShortPinyin(s1)
        @Assert("lrzz we win", res1)
    }

}
