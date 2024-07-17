// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.unittest.*


main() {
    try {
        PinyinHelper.hasMultiPinyin(r'。')
    }catch(e: Pinyin4cjException) {
        if(!e.toString().contains("Please enter a Chinese character")) {
            return -2
        }
        return 0
    }
    
    return -1
}


