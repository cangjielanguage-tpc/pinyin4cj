// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*


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
        @Assert(false, PinyinHelper.hasMultiPinyin(r'时'))
    }

    @TestCase
    public func test2(): Unit {
        let map: HashMap<String, String> = HashMap<String, String>([("时","shí,shǐ,shì")])
        PinyinHelper.addPinyinDictResource(map)
        @Assert(true, PinyinHelper.hasMultiPinyin(r'时'))
    }

}
