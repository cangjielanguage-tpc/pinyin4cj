// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("爱〔愛〕罢〔罷〕备〔備〕贝〔貝〕笔〔筆〕毕〔畢〕边〔邊〕宾〔賓〕", defaultFormat, "", true)
    if(pinyinArray != "ài〔ài〕bà〔bà〕bèi〔bèi〕bèi〔bèi〕bĭ〔bĭ〕bì〔bì〕biān〔biān〕bīn〔bīn〕") {
        return -1
    }
    return 0
}

