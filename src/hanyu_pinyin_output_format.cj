/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */
 
package pinyin4cj
/**
 * This classes define how the Hanyu Pinyin should be outputted.
 * 
 * Output format of character 'ü'
 * Output format of Chinese tones
 * Cases of letters in outputted string
 *
 * LOWERCASE
 *    Combination	    WITH_U_AND_COLON	WITH_V	          WITH_U_UNICODE
 *    WITH_TONE_NUMBER	    lu:3	         lv3	               lü3
 *    WITHOUT_TONE	        lu:	             lv	                   lü
 *    WITH_TONE_MARK	throw exception	    throw exception	       lǚ
 * UPPERCASE
 *    Combination	    WITH_U_AND_COLON	WITH_V	          WITH_U_UNICODE
 *    WITH_TONE_NUMBER	     LU:3	         LV3	               LÜ3
*     WITHOUT_TONE	         LU:	         LV	                   LÜ
 *    WITH_TONE_MARK	throw exception	     throw exception	   LǙ

 * 
 */
public class HanyuPinyinOutputFormat {

    private var vCharType: HanyuPinyinVCharType = HanyuPinyinVCharType("")

    private var caseType: HanyuPinyinCaseType = HanyuPinyinCaseType("")

    private var toneType: HanyuPinyinToneType = HanyuPinyinToneType("")

    public init() {
        restoreDefault()
    }

    public func restoreDefault(): Unit {
        vCharType = HanyuPinyinVCharType.WITH_U_AND_COLON
        caseType = HanyuPinyinCaseType.LOWERCASE
        toneType = HanyuPinyinToneType.WITH_TONE_NUMBER
    }

    public func getCaseType(): HanyuPinyinCaseType {
        return caseType
    }

    public func setCaseType(caseType: HanyuPinyinCaseType): Unit {
        this.caseType = caseType
    }

    public func getToneType(): HanyuPinyinToneType{
        return toneType
    }

    public func setToneType(toneType: HanyuPinyinToneType): Unit {
        this.toneType = toneType
    }

    public func getVCharType(): HanyuPinyinVCharType {
        return vCharType
    }

    public func setVCharType( charType: HanyuPinyinVCharType): Unit {
        vCharType = charType
    }
}
