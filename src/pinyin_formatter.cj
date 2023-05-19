/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import regex.*
from std import unicode.*
from std import collection.*

/**
 * Contains logic to format given Pinyin string
 */
class PinyinFormatter {

    static func formatHanyuPinyin(pinyinStr: String, outputFormat: HanyuPinyinOutputFormat): String {
        var str: String = pinyinStr
        if (
            (HanyuPinyinToneType.WITH_TONE_MARK.getName() == outputFormat.getToneType().getName()) &&
            ((HanyuPinyinVCharType.WITH_V.getName() == outputFormat.getVCharType().getName()) || 
            (HanyuPinyinVCharType.WITH_U_AND_COLON.getName() == outputFormat.getVCharType().getName()))
        ) {
            throw BadHanyuPinyinOutputFormatCombination("tone marks cannot be added to v or u:")
        }

        if (HanyuPinyinToneType.WITHOUT_TONE.getName() == outputFormat.getToneType().getName()) {
            str = Regex("[1-5]").matcher(str).replaceAll("")
        } else if (HanyuPinyinToneType.WITH_TONE_MARK.getName() == outputFormat.getToneType().getName()) {
            str = Regex("u:").matcher(str).replaceAll("v")
            str = convertToneNumber2ToneMark(str)
        }
        if (HanyuPinyinVCharType.WITH_V.getName() == outputFormat.getVCharType().getName()){
            str = Regex("u:").matcher(str).replaceAll("v")
        } else if (HanyuPinyinVCharType.WITH_U_UNICODE.getName() == outputFormat.getVCharType().getName()){
           // str = Regex("u:").matcher(str).replaceAll("ü")
            str = str.replace("u:", "ü")
        }
        if (HanyuPinyinCaseType.UPPERCASE.getName() == outputFormat.getCaseType().getName()){
            str = str.toUpper()
        }
        return str
    }

    /**
     * Convert tone numbers to tone marks using Unicode
     * 
     * <b>Algorithm for determining location of tone mark
     * 
     * A simple algorithm for determining the vowel on which the tone mark
     * appears is as follows:
     * 
     * First, look for an "a" or an "e". If either vowel appears, it takes
     * the tone mark. There are no possible pinyin syllables that contain both
     * an "a" and an "e".
     * 
     * If there is no "a" or "e", look for an "ou". If "ou" appears, then
     * the "o" takes the tone mark.
     * 
     * If none of the above cases hold, then the last vowel in the syllable
     * takes the tone mark.
     * 
     * @param pinyinStr - the ascii represention with tone numbers
     * @return String - the unicode represention with tone marks
     */
    private static func convertToneNumber2ToneMark(pinyinStr: String): String {
        var lowerCasePinyinStr: String = pinyinStr.toLower()
        
        if(let Some(l) = Regex("[a-z]*[1-5]?").matches(lowerCasePinyinStr)) {
            let defautlCharValue: Char = '$'
            let defautlIndexValue: Int64 = -1

            var unmarkedVowel: Char = defautlCharValue
            var indexOfUnmarkedVowel: Int64 = defautlIndexValue

            let charA: Char = 'a'
            let charE: Char = 'e'
            let ouStr: String = "ou"
            let allUnmarkedVowelStr: String = "aeiouv"
            let allMarkedVowelStr: String = "āáăàaēéĕèeīíĭìiōóŏòoūúŭùuǖǘǚǜü"

            if(let Some(ll) = Regex("[a-z]*[1-5]").matches(lowerCasePinyinStr)) {
                //get char unicode
                var tuneNumber: Int64 = Int64.parse((lowerCasePinyinStr.charAt(lowerCasePinyinStr.size - 1)).toString())
                var indexOfA: Int64 = lowerCasePinyinStr.indexOf(charA) ?? -1
                var indexOfE: Int64 = lowerCasePinyinStr.indexOf(charE) ?? -1
                var ouIndex: Int64 = lowerCasePinyinStr.indexOf(ouStr) ?? -1
                
                if (-1 != indexOfA){
                    unmarkedVowel = charA
                    indexOfUnmarkedVowel = indexOfA
                } else if (-1 != indexOfE){
                    unmarkedVowel = charE
                    indexOfUnmarkedVowel = indexOfE
                } else if (-1 != ouIndex){
                    unmarkedVowel = ouStr.charAt(0)
                    indexOfUnmarkedVowel = ouIndex
                } else{
                    var k: Int64 = lowerCasePinyinStr.size - 1  
                    do {
                        if (let Some(t) = Regex("[" + allUnmarkedVowelStr + "]").matches(lowerCasePinyinStr.charAt(k).toString())) {
                            indexOfUnmarkedVowel = k
                            unmarkedVowel = lowerCasePinyinStr.charAt(k)
                            break
                        } 
                        k-- 
                    } while(k >= 0)
                }

                if ((defautlCharValue != unmarkedVowel) && 
                    (defautlIndexValue != indexOfUnmarkedVowel)
                ){
                    var rowIndex: Int64 = allUnmarkedVowelStr.indexOf(unmarkedVowel) ?? -1
                    var columnIndex: Int64 = tuneNumber - 1
                    var vowelLocation: Int64 = rowIndex * 5 + columnIndex
                    var markedVowel: Char = allMarkedVowelStr.charAt(vowelLocation)
                    var resultBuffer: StringBuilder = StringBuilder()
                    resultBuffer.append(lowerCasePinyinStr.substring(0, indexOfUnmarkedVowel).replace("v", "ü"))
                    resultBuffer.append(markedVowel)
                    resultBuffer.append(lowerCasePinyinStr.substring(indexOfUnmarkedVowel + 1, 
                    lowerCasePinyinStr.size - (indexOfUnmarkedVowel + 1) - 1).replace("v", "ü"))

                    return resultBuffer.toString()

                } else {
                    // error happens in the procedure of locating vowel
                    return lowerCasePinyinStr
                }
            } else {
                // input string has no any tune number
                // only replace v with ü (umlat) character
                return lowerCasePinyinStr.replace("v", "ü")
            }     
        } else {
            //bad format
            return lowerCasePinyinStr
        }
    }
}
