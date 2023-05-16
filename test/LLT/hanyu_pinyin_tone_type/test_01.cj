// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinToneType = HanyuPinyinToneType.WITH_TONE_NUMBER

    if(format.getName() != "WITH_TONE_NUMBER") {
        return -1
    }
    return 0
}

