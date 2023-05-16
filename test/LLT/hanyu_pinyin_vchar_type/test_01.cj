// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinVCharType = HanyuPinyinVCharType.WITH_U_AND_COLON

    if(format.getName() != "WITH_U_AND_COLON") {
        return -1
    }
    return 0
}

