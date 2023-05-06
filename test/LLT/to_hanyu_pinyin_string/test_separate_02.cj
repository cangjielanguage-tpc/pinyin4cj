// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {    
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("获取单个汉字（简体和繁体）的所有无指定格式的汉语拼音，默认格式为小写字符串+数字声调", defaultFormat, "|", true)
    if(pinyinArray != "huo4|qu3|dan1|ge4|han4|zi4|（jian3|ti3|he2|fan2|ti3|）de5|suo3|you3|wu2|zhi3|ding4|ge2|shi4|de5|han4|yu3|pin1|yin1|，mo4|ren4|ge2|shi4|wei2|xiao3|xie3|zi4|fu2|chuan4|+shu4|zi4|sheng1|diao4") {
        return -1
    }
    return 0
}

