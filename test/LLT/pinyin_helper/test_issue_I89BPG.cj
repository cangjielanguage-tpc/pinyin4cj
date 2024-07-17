// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*

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
