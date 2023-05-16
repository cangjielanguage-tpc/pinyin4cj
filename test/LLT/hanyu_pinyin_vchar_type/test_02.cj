// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinVCharType = HanyuPinyinVCharType.WITH_V

    if(format.getName() != "WITH_V") {
        return -1
    }
    return 0
}

