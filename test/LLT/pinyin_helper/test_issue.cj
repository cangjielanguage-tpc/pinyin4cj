// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
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
        @Assert(["c", "z"], PinyinHelper.convertToPinyinArray('长', PinyinFormat.FIRST_LETTER))
        @Assert(["cháng", "zhǎng"], PinyinHelper.convertToPinyinArray('长', PinyinFormat.WITH_TONE_MARK))
    }

}
