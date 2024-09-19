// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.time.*
import std.unittest.*
import std.collection.*
import std.unittest.testmacro.*

main() {
    println("TCS: ahoCorasick4cj, time elapsed: 1 ns, RESULT:")
    let nums = [1000]
    let strLens = [1000]
    for (len in strLens) {
        var str: String = getStr(len/10)
        for (num in nums) {
            var s = ""
            let start = DateTime.now().nanosecond
            for (_ in 0..num) {
               PinyinHelper.convertToPinyinString(str, " ", PinyinFormat.WITH_TONE_MARK)
            }
            let end = DateTime.now().nanosecond - start
            println("[ PASSED ] CASE: TestSuitePinyin_${len}_${num} (${end} ns, ${end/num} ns/op)\n")
            println(s)
        }
    }
}

func getStr(len: Int64): String {
    let baseStr: String = "加瓦得是最好的语言。"
    let sb: StringBuilder = StringBuilder()
    
    for (_ in 0..len) {
        sb.append(baseStr)
    }
    return sb.toString()
}
