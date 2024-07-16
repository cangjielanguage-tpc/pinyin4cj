//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*
import std.time.*
import std.sync.*
@Test
public class pinyin_Reliability_addChineseDictResource_001 {
    @TestCase
    public func pinyin_Reliability_addChineseDictResource_001():Unit{
        let threadCount = 200
        let loopCount = 10000
        let futures = ArrayList<Future<Int64>>()
        var str = ChineseHelper.convertToSimplifiedChinese("鬍")
        println("str = ${str}")
        @Assert("鬍", ChineseHelper.convertToSimplifiedChinese("鬍"))
        let successCount = AtomicInt64(0)
        let s = DateTime.now()
        for (_ in 0..threadCount) {
            var thread = spawn {
                var threadSuccessCount = loopCount
                for (_ in 0..loopCount) {
                    try {
                        let chinese_dict: HashMap<Rune, Rune> = HashMap<Rune, Rune>([
                            (r'鬍', r'胡'),
                            (r'迴', r'回'),
                            (r'匯', r'汇'),
                            (r'穫', r'获'),
                            (r'颳', r'刮'),
                            (r'髮', r'发'),
                            (r'繋', r'系'),
                            (r'噁', r'恶'),
                            (r'噹', r'当'),
                            (r'鼕', r'冬'),
                            (r'闘', r'门'),
                            (r'纔', r'才'),
                            (r'乗', r'乘'),
                            (r'齣', r'出'),
                            (r'闇', r'暗')
                        ])
                        ChineseHelper.addChineseDictResource(chinese_dict)
                        var str = ChineseHelper.convertToSimplifiedChinese("鬍")
                        // println("str = ${str}")
                        @Assert("胡", ChineseHelper.convertToSimplifiedChinese("鬍"))
                    } catch (e: Exception) {
                        threadSuccessCount--
                        println("Exception!!!! ")
                        break
                    }
                }
                successCount.fetchAdd(threadSuccessCount)
            }
            futures.append(thread)
        }
        for (f in futures) {
            f.get()
        }
        println("futures:${futures.size}")
        println("s:${s}")
        println("Duration.since(s):${Duration.since(s)}")
        let e = Duration.since(s).toSeconds()
        println("线程数:${threadCount}")
        println("successCount:${successCount.load()}")
        println("循环次数:${loopCount}")
        println("耗时:${e} s")
        println("吞吐量:${Float32(successCount.load())/Float32(e)} 次/s")
    }
}