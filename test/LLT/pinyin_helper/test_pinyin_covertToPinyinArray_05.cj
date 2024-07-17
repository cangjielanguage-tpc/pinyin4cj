// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*


main() {    
    let TestHanYufanti = TestHanYufanti()
    TestHanYufanti.test1()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func test1(): Unit {
        @Assert([], PinyinHelper.convertToPinyinArray(r'。', PinyinFormat.WITH_TONE_MARK))
    }

}