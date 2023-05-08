// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("豸虿彧矟芈谶褫蠲兕醢仝垕", defaultFormat, ",", true)
    if(pinyinArray != "zhì,chài,yù,shuò,mĭ,chèn,chĭ,juān,sì,hăi,tóng,hòu") {
        return -1
    }
    return 0
}

