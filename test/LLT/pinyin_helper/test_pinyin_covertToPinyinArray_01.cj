// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
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
        @Assert(["cháng", "zhǎng"], PinyinHelper.convertToPinyinArray(r'长', PinyinFormat.WITH_TONE_MARK))
        @Assert(["yán"], PinyinHelper.convertToPinyinArray(r'嚴', PinyinFormat.WITH_TONE_MARK))
    }

}
