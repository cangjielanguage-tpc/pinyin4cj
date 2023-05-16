// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    format.setCaseType(HanyuPinyinCaseType.UPPERCASE)
    format.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
    format.setVCharType(HanyuPinyinVCharType.WITH_V)
    if(
        format.getCaseType().getName() != "UPPERCASE" ||
        format.getToneType().getName() != "WITHOUT_TONE" ||
        format.getVCharType().getName() != "WITH_V"
    ) {
        return -1
    }
    return 0
}


