// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("鑫森淼焱垚犇骉羴猋麤鱻贔掱劦晶磊毳", defaultFormat, ",", true)
    if(pinyinArray != "xīn,sēn,miăo,yàn,yáo,bēn,biāo,shān,biāo,cū,xiān,bì,shŏu,xié,jīng,lĕicuì") {
        return -1
    }
    return 0
}

