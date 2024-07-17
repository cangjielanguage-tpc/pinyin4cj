//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*
import std.time.*
import std.sync.*
@Test
public class pinyin_Reliability_convertToPinyinArray_001 {
    @TestCase
    public func pinyin_Reliability_convertToPinyinArray_001():Unit{
        let threadCount = 200
        let loopCount = 10000
        let futures = ArrayList<Future<Int64>>()

        var arrstr = PinyinHelper.convertToPinyinArray(r'答', PinyinFormat.WITH_TONE_MARK)
        println("arrstr = ${arrstr}")

        let successCount = AtomicInt64(0)
        let s = DateTime.now()
        for (_ in 0..threadCount) {
            var thread = spawn {
                var threadSuccessCount = loopCount
                for (_ in 0..loopCount) {
                    try {
                        var arrstr = PinyinHelper.convertToPinyinArray(r'答', PinyinFormat.WITH_TONE_MARK)
                        @Assert(arrstr.toString(),"[dá, dā]")
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