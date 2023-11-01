//3rd_party_lib:pinyin4cj/build/pinyin4cj

from pinyin4cj import pinyin4cj.*
from fuzz import fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_convertToTraditionalChinese(dp: DataProvider): Int32 {
    ChineseHelper.convertToTraditionalChinese(dp.consumeString(100))
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_convertToTraditionalChinese).startFuzz()      
    return 0
}