// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    try {
        PinyinHelper.hasMultiPinyin('。')
    }catch(e: Exception) {
        if(!e.toString().contains("Please enter a Chinese character")) {
            return -2
        }
        return 0
    }
    
    return -1
}


