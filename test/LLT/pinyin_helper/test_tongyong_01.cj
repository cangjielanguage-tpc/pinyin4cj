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
        @Assert(["ci4"], PinyinHelper.toTongyongPinyinStringArray('气'))
        @Assert(["ruei4"], PinyinHelper.toTongyongPinyinStringArray('瑞'))
        @Assert(["shih4"], PinyinHelper.toTongyongPinyinStringArray('是'))
        @Assert(["shuei2"], PinyinHelper.toTongyongPinyinStringArray('谁'))
        @Assert(["si1"], PinyinHelper.toTongyongPinyinStringArray('西'))
        @Assert(["sia4"], PinyinHelper.toTongyongPinyinStringArray('下'))
        @Assert(["siang3"], PinyinHelper.toTongyongPinyinStringArray('想'))
        @Assert(["siao4"], PinyinHelper.toTongyongPinyinStringArray('笑'))
        @Assert(["sie3"], PinyinHelper.toTongyongPinyinStringArray('写'))
        @Assert(["sih4"], PinyinHelper.toTongyongPinyinStringArray('四'))
        @Assert(["sin1"], PinyinHelper.toTongyongPinyinStringArray('新'))
        @Assert(["sing2"], PinyinHelper.toTongyongPinyinStringArray('型'))
        @Assert(["siou1"], PinyinHelper.toTongyongPinyinStringArray('修'))
        @Assert(["suei4"], PinyinHelper.toTongyongPinyinStringArray('岁'))
        @Assert(["syong2"], PinyinHelper.toTongyongPinyinStringArray('熊'))
        @Assert(["syu2"], PinyinHelper.toTongyongPinyinStringArray('徐'))
        @Assert(["syuan3"], PinyinHelper.toTongyongPinyinStringArray('选'))
        @Assert(["syue2"], PinyinHelper.toTongyongPinyinStringArray('学'))
        @Assert(["syun4"], PinyinHelper.toTongyongPinyinStringArray('讯'))
        @Assert(["tuei4"], PinyinHelper.toTongyongPinyinStringArray('退'))
        @Assert(["meng2"], PinyinHelper.toTongyongPinyinStringArray('盟'))
        @Assert(["wun4"], PinyinHelper.toTongyongPinyinStringArray('问'))
        @Assert(["zih4"], PinyinHelper.toTongyongPinyinStringArray('字'))
        @Assert(["zuei4"], PinyinHelper.toTongyongPinyinStringArray('最'))
        @Assert(["chuan2", "jhuan4"], PinyinHelper.toTongyongPinyinStringArray('傳'))
        @Assert(["chuan2", "jhuan4"], PinyinHelper.toTongyongPinyinStringArray('传'))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray(','))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray('，'))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray('&'))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray('~'))
        @Assert(["nyue4"], PinyinHelper.toTongyongPinyinStringArray('虐'))
        @Assert(["hao3", "hao4"], PinyinHelper.toTongyongPinyinStringArray('好'))
    }

}
