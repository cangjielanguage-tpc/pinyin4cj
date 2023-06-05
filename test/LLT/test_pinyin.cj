// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from std import time.*

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
        let s1: String = "河南麦收季遇10年最严重“烂场雨”，灾情如何？怎样应对？"
        let res1: String = PinyinHelper.convertToPinyinString(s1, " ", PinyinFormat.WITH_TONE_MARK)
        @Assert("hé nán mài shōu jì yù 10 nián zuì yán zhòng “ làn chǎng yǔ ”， zāi qíng rú hé ？ zěn yàng yīng duì ？", res1)
    }
}
