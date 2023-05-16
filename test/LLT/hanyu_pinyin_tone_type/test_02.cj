// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    let format: HanyuPinyinToneType = HanyuPinyinToneType.WITHOUT_TONE

    if(format.getName() != "WITHOUT_TONE") {
        return -1
    }
    return 0
}

