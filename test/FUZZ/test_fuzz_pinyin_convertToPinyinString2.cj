//3rd_party_lib:pinyin4cj/build/pinyin4cj

import pinyin4cj.*
import fuzz.fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_convertToPinyinString2(dp: DataProvider): Int32 {
    PinyinHelper.convertToPinyinString(dp.consumeString(200),dp.consumeString(5),PinyinFormat.WITH_TONE_MARK)
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_convertToPinyinString2).startFuzz()      
    return 0
}