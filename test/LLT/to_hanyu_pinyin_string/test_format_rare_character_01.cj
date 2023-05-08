// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("畾飝刕叒壵尛孨歮惢皛嚞舙譶雥灥飍馫飝厵靐龘众叒品瞐", defaultFormat, ",", true)
    if(pinyinArray != "léi,fēi,lí,ruò,zhuàng,yuán,chán,sè,ruĭ,jiŏng,zhé,huà,tà,zá,quán,biāo,xīng,fēi,yuán,bìng,tà,zhòng,ruò,pĭn,mào") {
        return -1
    }
    return 0
}

