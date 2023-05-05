// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {    
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE)
    defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_V)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("获取单个汉字（简体和繁体）的所有无指定格式的汉语拼音，默认格式为小写字符串+数字声调", defaultFormat, "", true)
    if(pinyinArray != "HUOQUDANGEHANZI（JIANTIHEFANTI）DESUOYOUWUZHIDINGGESHIDEHANYUPINYIN，MORENGESHIWEIXIAOXIEZIFUCHUAN+SHUZISHENGDIAO") {
        return -1
    }
    return 0
}

