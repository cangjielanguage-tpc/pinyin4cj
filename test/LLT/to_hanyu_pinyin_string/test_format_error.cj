// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {    
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_AND_COLON)

    try {
        PinyinHelper.toHanYuPinyinString("女医明妃传", defaultFormat, ";", true)
    }catch (e: BadHanyuPinyinOutputFormatCombination) {
        println(e.toString())
        if(!e.toString().contains("tone marks cannot be added to v or u:")) {
            return -1
        }
        return 0
    }
    return -2
}

