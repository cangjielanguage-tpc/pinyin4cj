// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
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
        @Assert(false, PinyinHelper.hasMultiPinyin('时'))
    }

    @TestCase
    public func test2(): Unit {
        let map: HashMap<String, String> = HashMap<String, String>([("时","shí,shǐ,shì")])
        PinyinHelper.addPinyinDictResource(map)
        @Assert(true, PinyinHelper.hasMultiPinyin('时'))
    }

}
