// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let testChineseHelper = TestChineseHelper()
    testChineseHelper.test1()
    return 0
}

@Test
public class TestChineseHelper {
    @TestCase
    public func test1(): Unit {
        let map: HashMap<Char, Char> = HashMap<Char, Char>([('癥', '症'), ('臺', '一')])
        ChineseHelper.addChineseDictResource(map)
        @Assert("症", ChineseHelper.convertToSimplifiedChinese("癥"))
        @Assert("一", ChineseHelper.convertToSimplifiedChinese("臺"))
    }
}