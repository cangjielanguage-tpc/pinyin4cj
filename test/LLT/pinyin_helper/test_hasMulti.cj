// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    try {
        PinyinHelper.hasMultiPinyin('。')
    }catch(e: Pinyin4cjException) {
        if(!e.toString().contains("Please enter a Chinese character")) {
            return -2
        }
        return 0
    }
    
    return -1
}


