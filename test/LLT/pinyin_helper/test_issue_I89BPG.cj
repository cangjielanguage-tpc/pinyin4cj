// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import collection.*

main() {
    try {
        PinyinHelper.convertToPinyinString("", " ", PinyinFormat.WITH_TONE_MARK)
    }catch(e: Pinyin4cjException) {
        if(!e.toString().contains("Please enter a word or sentence")) {
            return -1
        }
        return 0
    }
    return -2
}
