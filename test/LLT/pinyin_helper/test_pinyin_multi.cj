// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let testPinyinHelper = TestPinyinHelper()
    testPinyinHelper.test1()
    return 0
}
@Test
public class TestPinyinHelper {
    @TestCase
    public func test1(): Unit {
        @Assert(true, PinyinHelper.hasMultiPinyin('长'))
        @Assert(true, PinyinHelper.hasMultiPinyin('大'))
        @Assert(true, PinyinHelper.hasMultiPinyin('阿'))
        @Assert(false, PinyinHelper.hasMultiPinyin('你'))
    }

}
