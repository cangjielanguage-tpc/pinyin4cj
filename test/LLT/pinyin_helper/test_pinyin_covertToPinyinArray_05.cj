// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {    
    let TestHanYufanti = TestHanYufanti()
    TestHanYufanti.test1()
    return 0
}

@Test
public class TestHanYufanti {
    @TestCase
    public func test1(): Unit {
        @Assert([], PinyinHelper.convertToPinyinArray('。', PinyinFormat.WITH_TONE_MARK))
    }

}