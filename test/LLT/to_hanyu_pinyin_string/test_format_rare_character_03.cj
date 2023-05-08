// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("馫龘飝鱻灥麤靐飍朤淼馫譶龘灥靐馫", defaultFormat, ",", true)
    if(pinyinArray != "xīng,tà,fēi,xiān,quán,cū,bìng,biāo,lăng,miăo,xīng,tà,tà,quán,bìng,xīng") {
        return -1
    }
    return 0
}

