/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import io.*
from std import math.*

let PINYIN_TABLE: HashMap<String, String> = PinyinResource.getPinyinResource()
let MUTIL_PINYIN_TABLE: HashMap<String, String> = PinyinResource.getMutilPinyinResource()
var PINYIN_SEPARATOR = "," 
var CHINESE_LING: Char = '〇'
var ALL_UNMARKED_VOWEL: String = "aeiouv"
var ALL_MARKED_VOWEL: String = "āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜ"

/**
 * Pinyin conversion
 */
public class PinyinHelper {

    /*
     * Convert pinyin with tone format to pinyin with numbers representing tone format
     *
     * @param str - pinyin with tone format
     * @return Array<String> - pinyin with numbers representing tone format
     */
    static func convertWithToneNumber(str: String): Array<String> {
        var pinyinArray: Array<String> = str.split(PINYIN_SEPARATOR)
        
        for(i in 0..pinyinArray.size) {
            var hasMarkedChar: Bool = false
            var originalPinyin: String = pinyinArray[i].replace("ü", "v")
            
            for(j in 0..originalPinyin.size) {
                var originalChar: Char = originalPinyin.get(j).getOrThrow()
                if(UInt32(originalChar) < UInt32('a') || UInt32(originalChar) > UInt32('z')) {
                    var indexInAllMarked: Int64 = ALL_MARKED_VOWEL.indexOf(originalChar).getOrThrow()
                    var toneNumber: Int64 = indexInAllMarked % 4 + 1
                    var replaceChar: Char = ALL_UNMARKED_VOWEL.get((indexInAllMarked - indexInAllMarked % 4) / 4).getOrThrow()
                    
                    pinyinArray[i] = originalPinyin.replace(originalChar, replaceChar).concat(toneNumber.toString()) 
                    hasMarkedChar = true
                    break
                }
            }
            if(!hasMarkedChar) {
                // Unable to find a pinyin letter with a tone, indicating a light tone, represented by the number 5
                pinyinArray[i] = originalPinyin + "5"
            }
        }
        return pinyinArray
    }

    /*
     * Convert Pinyin with tone format to Pinyin without tone format
     *
     * @param str - Pinyin with tone format
     * @return Array<String> - Pinyin without tone format
     */
    static func convertWithoutTone(str: String): Array<String> {
        var s: String = str
        var pinyinArray: Array<String> = Array<String>()
        for(i in 0..ALL_MARKED_VOWEL.size) {
            var originalChar: Char = ALL_MARKED_VOWEL.get(i).getOrThrow()
            var replaceChar: Char = ALL_UNMARKED_VOWEL.get((i - i % 4) / 4).getOrThrow()
            s = s.replace(originalChar.toString(), replaceChar.toString())
        }
        pinyinArray = s.replace("ü", "v").split(PINYIN_SEPARATOR)
        return pinyinArray
    }

    /*
     * Formatting Pinyin with Tones into Corresponding Formatted Pinyin
     *
     * @param str - Pinyin with tone format
     * @param format - format
     * @return Array<String>
     */
    static func formatPinyin(str: String, format: PinyinFormat): Array<String>{

        if (format.getName() == "WITH_TONE_MARK") {
			return str.split(PINYIN_SEPARATOR)
		} else if (format.getName() == "WITH_TONE_NUMBER") {
			return convertWithToneNumber(str)
		} else if (format.getName() == "WITHOUT_TONE") {
			return convertWithoutTone(str)
		} else if (format.getName() == "FIRST_LETTER") {
            return convertWithoutTone(str)
        }
		return Array<String>()
    }

    /* 
     * Convert individual Chinese characters into corresponding pinyin formats
     *
     * @param str - Chinese characters
     * @param format - format
     * @return Array<String>
     */
    public static func convertToPinyinArray(c: Char, format: PinyinFormat): Array<String> {  
        var pinyinArray: Array<String> = Array<String>()
        if(let Some(v) = PINYIN_TABLE.get(c.toString())) {
            if(format.getName() == "FIRST_LETTER") {
                pinyinArray = formatPinyin(v, format)
                for(i in 0..pinyinArray.size) {
                   pinyinArray[i] = pinyinArray[i].get(0).getOrThrow().toString()
                }
            } else {
                pinyinArray = formatPinyin(v, format)
            }
        }
        return pinyinArray
    }

    static func convertToPinyinArrays(c: Char, format: PinyinFormat): Array<String> {  
        var pinyinArray: Array<String> = Array<String>()
        if(let Some(v) = PINYIN_TABLE.get(c.toString())) {
            pinyinArray = formatPinyin(v, format)
        }
        return pinyinArray
    }

    /* 
     * Gets whether the given string finds the pinyin correspondence of the phrase in the dictionary
     *
     * @param str - Chinese characters
     * @return Array<String>
     */
    static func getWords(str: String): Array<String> { 
        for(i in 1..math.min(str.size + 1, 6)) {
            match(MUTIL_PINYIN_TABLE.get(str.substring(0, i))) {
                case None => continue
                case Some(_) => return [str.substring(0, i)]
            }
        }
        return []
    }

    /* 
     * Convert strings into corresponding pinyin formats
     *
     * @param str - Chinese characters
     * @param separator - Separator
     * @param format - PinyinFormat
     * @return String
     */
    public static func convertToPinyinString(str: String, separator: String, format: PinyinFormat): String {
        var resultPinyinStrBuf: StringBuilder = StringBuilder()
        let string: String = ChineseHelper.convertToSimplifiedChinese(str)
        var (pos, i, strLen): (Int64, Int64, Int64) = (0, 0, string.size)
        while(i < strLen) {
            var subStr: String = string.substring(i)
            var commonPrefixList: Array<String> = getWords(subStr) 
            if(commonPrefixList.size == 0) {
                var c: Char = string.get(i).getOrThrow()
                if(ChineseHelper.isChinese(c) || c == CHINESE_LING) {
                    var pinyinArray: Array<String> = convertToPinyinArrays(c, format)
                    if(pinyinArray.size > 0) {
                        if(format.getName() == "FIRST_LETTER"){
                            resultPinyinStrBuf.append(pinyinArray[0].get(0).getOrThrow().toString().concat(separator))
                            pos++
                        }else{
                            resultPinyinStrBuf.append(pinyinArray[0].concat(separator))
                            pos++
                        }
                    }else{
                        resultPinyinStrBuf.append(c.toString())
                    }
                } else {
                    if(separator.size != 0 && ((i + 1) < strLen) && ChineseHelper.isChinese(string.get(i + 1).getOrThrow())) {
                        resultPinyinStrBuf.append(c.toString().concat(separator))
                    } else {
                        resultPinyinStrBuf.append(c.toString())
                    } 
                }
                i++
            } else {
                var words: String = commonPrefixList[commonPrefixList.size - 1]
                var pinyinArray: Array<String> = formatPinyin(MUTIL_PINYIN_TABLE[words], format)
                for(j in 0..pinyinArray.size) {
                    if(format.getName() == "FIRST_LETTER"){
                        resultPinyinStrBuf.append(pinyinArray[j].get(0).getOrThrow().toString().concat(separator))
                        pos++
                    }else{
                        resultPinyinStrBuf.append(pinyinArray[j].concat(separator))
                        pos++
                    }
                }
                i += words.size
            }
        }
        
        return convertToPinyinStringResult(resultPinyinStrBuf, separator)
    }

    static func convertToPinyinStringResult(buf: StringBuilder, separator: String): String {
        var res: String = buf.toString()
        if(separator.size != 0 && (res.get(res.size - 1).getOrThrow().toString() == separator)) {
            let lastIndex: Int64 = res.lastIndexOf(separator).getOrThrow()
            res = res.substring(0, lastIndex)
        }
        return res
    }

    /* 
     * Convert strings into corresponding pinyin formats
     *
     * @param str - Chinese characters
     * @param separator - Separator
     * @return String
     */
    public static func convertToPinyinString(str: String, separator: String): String {
        return convertToPinyinString(str, separator, PinyinFormat.WITH_TONE_MARK)
    }

    /* 
     * Obtain the first letter of the pinyin corresponding to the string
     *
     * @param str - Chinese characters
     * @return String
     */
    public static func getShortPinyin(str: String): String {
        return convertToPinyinString(str, "", PinyinFormat.FIRST_LETTER)
    }

    /* 
     * 判断一个汉字是否为多音字
     *
     * @param c - Chinese characters
     * @return Bool
     */
    public static func hasMultiPinyin(c: Char): Bool {
        if(!ChineseHelper.isChinese(c)) {
            throw Exception("Please enter a Chinese character")
        } 
        var pinyin: String = PINYIN_TABLE[c.toString()]
        return pinyin.split(',').size > 1
    }

    /**
     * Add Pinyin dictionary
     *
     * @param dict - Pinyin dictionary
     * @return Unit
     */
    public static func addPinyinDictResource(dict: HashMap<String, String>): Unit {
        PINYIN_TABLE.putAll(dict)
    }

    /**
     * Add MutilPinyin dictionary
     *
     * @param dict - MutilPinyin dictionary
     * @return Unit
     */
    public static func addMutilPinyinDictResource(dict: HashMap<String, String>): Unit {
        MUTIL_PINYIN_TABLE.putAll(dict)   
    }
}