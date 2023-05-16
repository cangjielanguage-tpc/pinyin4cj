/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * A class provides several utility functions to convert Chinese characters
 * (both Simplified and Tranditional) into various Chinese Romanization
 * representations
 */
public class PinyinHelper {
    private static var ARR_EMPTY: Array<String> = []
    private static var EMPTY: String = ""
    /**
     * Word or sentence to pinyin
     * 
     * @param str - Word or sentence
     * @param outputFormat - The required format of the returned Chinese Pinyin string
     * @param separate - Delimiter, attached after a Chinese character 
     *                   (excluding the last Chinese character at the end of 
     *                   a sentence and non Chinese characters)
     * @param retain - Do you want to keep characters that cannot be converted to pinyin characters
     * @return String - A string in which all Chinese characters are replaced by their corresponding
     *                  Pinyin representation
     */
    static public func toHanYuPinyinString(str: String, outputFormat: HanyuPinyinOutputFormat,
                                            separate: String, retain: Bool): String {
        if(str.size == 0) {
            throw Exception("Provide words or sentences to be converted")
        }
        var resource: ChineseToPinyinResource = ChineseToPinyinResource.getInstance()
        var resultPinyinStrBuf: StringBuilder = StringBuilder()
        var chars: Array<Char> = str.toCharArray()

        var k: Int64 = 0
        do {
            var result: String = ""//Longest result matched
            var ch: Char = chars[k]
            var currentTrie: Option<Trie> = resource.getUnicodeToHanyuPinyinTable()
            var success: Int64 = k
            var current: Int64 = k
            do {
                let hexStr: String = UInt32(ch).format("0x").toUpper()
                currentTrie = currentTrie.getOrThrow().get(hexStr)
                if(let Some(t) = currentTrie) {
                    if (t.getPinyin() != "") {
                        result = t.getPinyin()
                        success = current
                    }
                    currentTrie = t.getNextTire()
                }
                current++
                if (current < chars.size) {
                    ch = chars[current]
                }else {
                    break
                } 
                match(currentTrie) {
                    case None => break
                    case Some(t) => ()      
                }       
            } while (true)

            /*
             * If there is no match in the prefix tree, it cannot be converted to pinyin 
             * and can be directly output or removed
            */
            if (result == "") {
                if (retain) {
                    resultPinyinStrBuf.append(chars[k])
                } 
            } else {
                var pinyinStrArray: Array<String> = resource.parsePinyinString(result)
                if (pinyinStrArray.size != 0) {
                    var n: Int64 = 0
                    do {
                        resultPinyinStrBuf.append(PinyinFormatter.formatHanyuPinyin(pinyinStrArray[n], outputFormat))
                        //Not the last one, (nor the last one in Pinyin, and not the last one to match successfully)
                        if (current < chars.size || (n <= pinyinStrArray.size - 1)) {
                            resultPinyinStrBuf.append(separate)
                        }
                        if (k == success) {
                            break
                        }
                        n++ 
                    } while(n < pinyinStrArray.size)
                }
            }
            k = success
            k++
        }while(k < chars.size)
        var res: String = resultPinyinStrBuf.toString()
        if(separate.size != 0) {
            let lastIndex: Int64 = res.lastIndexOf(separate).getOrThrow()
            res = res.substring(0, lastIndex)
        }
        return res
    }
    /**
     * Get all unformmatted Tongyong Pinyin presentations of a single Chinese
     * character (both Simplified and Tranditional)
     *
     * @param - ch the given Chinese character
     * @return-  a String array contains all unformmatted Tongyong Pinyin
     * presentations with tone numbers null for non-Chinese character
     */
    static public func toTongyongPinyinStringArray(ch: Char): Array<String> {
        return convertToTargetPinyinStringArray(ch, PinyinRomanizationType.TONGYONG_PINYIN)
    }

    private static func convertToTargetPinyinStringArray(
        ch: Char,
        targetPinyinSystem: PinyinRomanizationType
        ): Array<String> {
        var hanyuPinyinStringArray: Array<String> = getUnformattedHanyuPinyinStringArray(ch)

        if (hanyuPinyinStringArray.size != 0) {
           var targetPinyinStringArray: Array<String> = Array<String>(hanyuPinyinStringArray.size, item: "")
            var i: Int64 = 0
            do {
                targetPinyinStringArray[i] =
                    PinyinRomanizationTranslator.convertRomanizationSystem(
                        hanyuPinyinStringArray[i],
                        PinyinRomanizationType.HANYU_PINYIN,
                        targetPinyinSystem
                    )
                i++
            } while(i < hanyuPinyinStringArray.size)
            return targetPinyinStringArray
        } else {
            return ARR_EMPTY
        }
        return ARR_EMPTY   
    }

    private static func getUnformattedHanyuPinyinStringArray(ch: Char): Array<String> {
        return ChineseToPinyinResource.getInstance().getHanyuPinyinStringArray(ch)
    }

    /**
     * Get all unformmatted Hanyu Pinyin presentations of a single Chinese
     * character (both Simplified and Tranditional)
     * 
     * For example,  If the input is '间', the return will be an array with
     * two Hanyu Pinyin strings:  "jian1"  "jian4"  If the
     * input is '李', the return will be an array with single Hanyu Pinyin
     * string:  "li3"
     * 
     * Special Note: If the return is "none0", that means the input
     * Chinese character exists in Unicode CJK talbe, however, it has no
     * pronounciation in Chinese
     *
     * @param ch - the given Chinese character
     * @return Array<String> - a String array contains all unformmatted Hanyu Pinyin
     * presentations with tone numbers; null for non-Chinese character
     */
    static public func toHanyuPinyinStringArray(ch: Char): Array<String> {
        return getUnformattedHanyuPinyinStringArray(ch)
    }

    /**
     * Get all Hanyu Pinyin presentations of a single Chinese character (both
     * Simplified and Tranditional)
     * 
     * For example, If the input is '间', the return will be an array with
     * two Hanyu Pinyin strings:"jian1" "jian4"  If the
     * input is '李', the return will be an array with single Hanyu Pinyin
     * string:  "li3"
     * 
     * Special Note: If the return is "none0", that means the input
     * Chinese character is in Unicode CJK talbe, however, it has no
     * pronounciation in Chinese
     *
     * @param ch - the given Chinese character
     * @param outputFormat -  describes the desired format of returned Hanyu Pinyin String
     * @return Array<String> - a String array contains all Hanyu Pinyin presentations with tone
     *                         numbers; return empty string for non-Chinese character
     * @throws BadHanyuPinyinOutputFormatCombination if certain combination of output formats happens
     */
    static public func toHanyuPinyinStringArray(ch: Char, outputFormat: HanyuPinyinOutputFormat): Array<String> {
        return getFormattedHanyuPinyinStringArray(ch, outputFormat)
    }

    static private func getFormattedHanyuPinyinStringArray(ch: Char, outputFormat: HanyuPinyinOutputFormat): Array<String> {
        var pinyinStrArray: Array<String> = getUnformattedHanyuPinyinStringArray(ch)

        if (pinyinStrArray.size != 0) {
            for (i in 0..pinyinStrArray.size) {
                pinyinStrArray[i] = PinyinFormatter.formatHanyuPinyin(pinyinStrArray[i], outputFormat)
            }
            return pinyinStrArray
        }
        return ARR_EMPTY
    }
}
