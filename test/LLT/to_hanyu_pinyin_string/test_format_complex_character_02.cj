// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("参〔參〕仓〔倉〕产〔産〕长〔長〕(1) 尝〔嘗〕车〔車〕齿〔齒〕虫〔蟲〕从〔從〕窜〔竄〕", defaultFormat, "", true)
    if(pinyinArray != "cān〔cān〕cāng〔cāng〕chăn〔chăn〕zhăng〔cháng〕(1) cháng〔cháng〕chē〔chē〕chĭ〔chĭ〕chóng〔chóng〕cóng〔cóng〕cuàn〔cuàn〕") {
        return -1
    }
    return 0
}

