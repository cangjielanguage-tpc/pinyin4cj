// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {    
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("律所吕布骑驴绿色屡次过滤考虑僧侣", defaultFormat, "", true)
    if(pinyinArray != "lu:suolu:buqilu:lu:selu:ciguolu:kaolu:senglu:") {
        return -1
    }
    return 0
}

