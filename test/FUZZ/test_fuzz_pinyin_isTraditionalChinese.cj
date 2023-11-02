//3rd_party_lib:pinyin4cj/build/pinyin4cj

from pinyin4cj import pinyin4cj.*
from fuzz import fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_isTraditionalChinese(dp: DataProvider): Int32 {
    ChineseHelper.isTraditionalChinese(dp.consumeChar())
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_isTraditionalChinese).startFuzz()      
    return 0
}