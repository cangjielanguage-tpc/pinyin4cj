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

    /**
     * Initialize Chinese Pinyin output format
     */
    public init() {
        restoreDefault()
    }

    /**
     * Reset Chinese Pinyin Output Format
     */
    public func restoreDefault(): Unit {
        vCharType = HanyuPinyinVCharType.WITH_U_AND_COLON
        caseType = HanyuPinyinCaseType.LOWERCASE
        toneType = HanyuPinyinToneType.WITH_TONE_NUMBER
    }

    /**
     * Get Case Type
     */
    public func getCaseType(): HanyuPinyinCaseType {
        return caseType
    }

    /**
     * Set Case Type
     * 
     * @param caseType - HanyuPinyinCaseType
     */
    public func setCaseType(caseType: HanyuPinyinCaseType): Unit {
        this.caseType = caseType
    }

    /**
     * Get Tone Type
     */
    public func getToneType(): HanyuPinyinToneType{
        return toneType
    }

    /**
     * Set Tone Type
     * 
     * @param toneType - HanyuPinyinToneType
     */
    public func setToneType(toneType: HanyuPinyinToneType): Unit {
        this.toneType = toneType
    }

    /**
     * Get Output format of character 'ü' Type
     */
    public func getVCharType(): HanyuPinyinVCharType {
        return vCharType
    }

    /**
     * Set VChar Type
     * 
     * @param charType - HanyuPinyinVCharType
     */
    public func setVCharType( charType: HanyuPinyinVCharType): Unit {
        vCharType = charType
    }
}
