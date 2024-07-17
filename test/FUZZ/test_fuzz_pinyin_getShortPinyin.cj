//3rd_party_lib:pinyin4cj/build/pinyin4cj

import pinyin4cj.*
import fuzz.fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_getShortPinyin(dp: DataProvider): Int32 {
    PinyinHelper.getShortPinyin(dp.consumeString(200))
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_getShortPinyin).startFuzz()      
    return 0
}