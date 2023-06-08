// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let testPinyinHelper = TestPinyinHelper()
    testPinyinHelper.test1()
    testPinyinHelper.test2()
    return 0
}

@Test
public class TestPinyinHelper {
    @TestCase
    public func test1(): Unit {
        let s1: String = "了如指掌"
        let res1: String = PinyinHelper.convertToPinyinString(s1, " ", PinyinFormat.WITH_TONE_MARK)
        @Assert("liǎo rú zhǐ zhǎng", res1)
    }

    @TestCase
    public func test2(): Unit {
        let s1: String = "了如指掌"
        let res1: String = PinyinHelper.convertToPinyinString(s1, " ", PinyinFormat.FIRST_LETTER)
        println(res1)
        @Assert("l r z z", res1)
    }
}
