//3rd_party_lib:pinyin4cj/build/pinyin4cj

from pinyin4cj import pinyin4cj.*
from fuzz import fuzz.*


var returnFlag: Int32 = 0
public func test_fuzz_pinyin_containsChinese(dp: DataProvider): Int32 {
    ChineseHelper.containsChinese(dp.consumeString(10))
    return returnFlag
}
main(){
    Fuzzer(test_fuzz_pinyin_containsChinese).startFuzz()      
    return 0
}