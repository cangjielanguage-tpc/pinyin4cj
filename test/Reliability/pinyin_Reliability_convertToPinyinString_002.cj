//3rd_party_lib:pinyin4cj/build/pinyin4cj

from std import unittest.*
from std import unittest.testmacro.*
from pinyin4cj import pinyin4cj.*
from std import collection.*
from std import time.*
from std import sync.*
@Test
public class pinyin_Reliability_convertToPinyinString_002 {
    @TestCase
    public func pinyin_Reliability_convertToPinyinString_002():Unit{
        let threadCount = 200
        let loopCount = 10000
        let futures = ArrayList<Future<Int64>>()

        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
        println("str = ${str}")

        let successCount = AtomicInt64(0)
        let s = DateTime.now()
        for (_ in 0..threadCount) {
            var thread = spawn {
                var threadSuccessCount = loopCount
                for (_ in 0..loopCount) {
                    try {
                        var str = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
                        @Assert(str,"wo3 shi4 zhong1 guo2 gong4 chan3 zhu3 yi4 jie1 ban1 ren2 。")   
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