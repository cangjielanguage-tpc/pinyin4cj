// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("雜臓贜髒鑿棗竈齋氈戰趙摺這徵癥證隻祗衹緻製鐘鍾腫種衆晝硃燭築莊樁妝裝壯狀凖濁總鑽", defaultFormat, ",", true)
    if(pinyinArray != "zá,zàng,zāng,zāng,záo,zăo,zào,zhāi,zhān,zhàn,zhào,zhé,zhè,zhĭ,zhēng,zhèng,zhī,zhī,qí,zhì,zhì,zhōng,zhōng,zhŏng,zhŏng,zhòng,zhòu,zhū,zhú,zhú,zhuāng,zhuāng,zhuāng,zhuāng,zhuàng,zhuàng,zhŭn,zhuó,zŏng,zuàn") {
        return -1
    }
    return 0
}

