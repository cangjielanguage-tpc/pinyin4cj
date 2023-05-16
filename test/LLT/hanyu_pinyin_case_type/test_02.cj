// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinCaseType = HanyuPinyinCaseType.LOWERCASE

    if(format.getName() != "LOWERCASE") {
        return -1
    }
    return 0
}

