//3rd_party_lib:pinyin4cj/build/pinyin4cj

from pinyin4cj import pinyin4cj.*
from fuzz import fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_isChinese(dp: DataProvider): Int32 {
    ChineseHelper.isChinese(dp.consumeChar())
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_isChinese).startFuzz()      
    return 0
}