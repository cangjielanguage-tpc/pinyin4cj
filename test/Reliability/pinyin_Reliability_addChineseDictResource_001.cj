//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import time.*
from std import sync.*
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
                        let chinese_dict: HashMap<Char, Char> = HashMap<Char, Char>([
                            ('鬍', '胡'),
                            ('迴', '回'),
                            ('匯', '汇'),
                            ('穫', '获'),
                            ('颳', '刮'),
                            ('髮', '发'),
                            ('繋', '系'),
                            ('噁', '恶'),
                            ('噹', '当'),
                            ('鼕', '冬'),
                            ('闘', '门'),
                            ('纔', '才'),
                            ('乗', '乘'),
                            ('齣', '出'),
                            ('闇', '暗')
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