// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*
from std import time.*

main() {    
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    var pinyinArray: Array<String> = PinyinHelper.toTongyongPinyinStringArray('李')
    if(pinyinArray != ["li3"]) {
        return -1
    }
    return 0
}

