//3rd_party_lib:pinyin4cj/build/pinyin4cj

import pinyin4cj.*
import fuzz.fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_toTongyongPinyinStringArray(dp: DataProvider): Int32 {
    PinyinHelper.toTongyongPinyinStringArray(dp.consumeChar())
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_toTongyongPinyinStringArray).startFuzz()      
    return 0
}