// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {    
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("获取单个汉字（简体和繁体）的所有无指定格式的汉语拼音，默认格式为小写字符串+数字声调", defaultFormat, "", false)

    if(pinyinArray != "huo4qu3dan1ge4han4zi4jian3ti3he2fan2ti3de5suo3you3wu2zhi3ding4ge2shi4de5han4yu3pin1yin1mo4ren4ge2shi4wei2xiao3xie3zi4fu2chuan4shu4zi4sheng1diao4") {
        return -1
    }
    return 0
}

