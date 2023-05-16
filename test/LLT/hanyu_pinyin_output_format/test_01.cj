// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    format.restoreDefault()
    if(
        format.getCaseType().getName() != "LOWERCASE" ||
        format.getToneType().getName() != "WITH_TONE_NUMBER" ||
        format.getVCharType().getName() != "WITH_U_AND_COLON"
    ) {
        return -1
    }
    return 0
}