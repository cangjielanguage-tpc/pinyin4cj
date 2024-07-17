// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
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
        @Assert(["ci4"], PinyinHelper.toTongyongPinyinStringArray(r'气'))
        @Assert(["ruei4"], PinyinHelper.toTongyongPinyinStringArray(r'瑞'))
        @Assert(["shih4"], PinyinHelper.toTongyongPinyinStringArray(r'是'))
        @Assert(["shuei2"], PinyinHelper.toTongyongPinyinStringArray(r'谁'))
        @Assert(["si1"], PinyinHelper.toTongyongPinyinStringArray(r'西'))
        @Assert(["sia4"], PinyinHelper.toTongyongPinyinStringArray(r'下'))
        @Assert(["siang3"], PinyinHelper.toTongyongPinyinStringArray(r'想'))
        @Assert(["siao4"], PinyinHelper.toTongyongPinyinStringArray(r'笑'))
        @Assert(["sie3"], PinyinHelper.toTongyongPinyinStringArray(r'写'))
        @Assert(["sih4"], PinyinHelper.toTongyongPinyinStringArray(r'四'))
        @Assert(["sin1"], PinyinHelper.toTongyongPinyinStringArray(r'新'))
        @Assert(["sing2"], PinyinHelper.toTongyongPinyinStringArray(r'型'))
        @Assert(["siou1"], PinyinHelper.toTongyongPinyinStringArray(r'修'))
        @Assert(["suei4"], PinyinHelper.toTongyongPinyinStringArray(r'岁'))
        @Assert(["syong2"], PinyinHelper.toTongyongPinyinStringArray(r'熊'))
        @Assert(["syu2"], PinyinHelper.toTongyongPinyinStringArray(r'徐'))
        @Assert(["syuan3"], PinyinHelper.toTongyongPinyinStringArray(r'选'))
        @Assert(["syue2"], PinyinHelper.toTongyongPinyinStringArray(r'学'))
        @Assert(["syun4"], PinyinHelper.toTongyongPinyinStringArray(r'讯'))
        @Assert(["tuei4"], PinyinHelper.toTongyongPinyinStringArray(r'退'))
        @Assert(["meng2"], PinyinHelper.toTongyongPinyinStringArray(r'盟'))
        @Assert(["wun4"], PinyinHelper.toTongyongPinyinStringArray(r'问'))
        @Assert(["zih4"], PinyinHelper.toTongyongPinyinStringArray(r'字'))
        @Assert(["zuei4"], PinyinHelper.toTongyongPinyinStringArray(r'最'))
        @Assert(["chuan2", "jhuan4"], PinyinHelper.toTongyongPinyinStringArray(r'傳'))
        @Assert(["chuan2", "jhuan4"], PinyinHelper.toTongyongPinyinStringArray(r'传'))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray(r','))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray(r'，'))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray(r'&'))
        @Assert([], PinyinHelper.toTongyongPinyinStringArray(r'~'))
        @Assert(["nyue4"], PinyinHelper.toTongyongPinyinStringArray(r'虐'))
        @Assert(["hao3", "hao4"], PinyinHelper.toTongyongPinyinStringArray(r'好'))
    }

}
