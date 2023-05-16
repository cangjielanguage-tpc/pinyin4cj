// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinCaseType = HanyuPinyinCaseType.UPPERCASE

    if(format.getName() != "UPPERCASE") {
        return -1
    }
    return 0
}

