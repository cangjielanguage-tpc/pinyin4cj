/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

let PINYIN_TABLE: HashMap<String, String> = PinyinResource.getPinyinResource()
let MUTIL_PINYIN_TABLE: HashMap<String, String> = PinyinResource.getMutilPinyinResource()
let TONGYONG_PINYIN_TABLE: HashMap<String, String> = PinyinResource.getTongyongPinyinResource()
var PINYIN_SEPARATOR = "," 
var CHINESE_LING: Char = '〇'
let ALL_UNMARKED_VOWEL_ARRAY: Array<Char> = ['a', 'e', 'i', 'o', 'u', 'v']
let ALL_MARKED_VOWEL_ARRAY: Array<Char> = ['ā', 'á', 'ǎ', 'à', 'ē', 'é', 'ě', 'è', 'ī', 'í', 'ǐ', 'ì', 'ō', 'ó', 'ǒ', 'ò', 'ū', 'ú', 'ǔ', 'ù', 'ǖ', 'ǘ', 'ǚ', 'ǜ']

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

            var originalCharArray: Array<Char> = originalPinyin.toRuneArray()
            for(j in 0..originalPinyin.size) {
                var originalChar: Char = originalCharArray[j]
                if(UInt32(originalChar) < UInt32('a') || UInt32(originalChar) > UInt32('z')) {
                    var indexInAllMarked: Int64 = findArrayKeyByValue(originalChar)
                    var toneNumber: Int64 = indexInAllMarked % 4 + 1
                    var replaceChar: Char = ALL_UNMARKED_VOWEL_ARRAY[(indexInAllMarked - indexInAllMarked % 4) / 4]
                    originalCharArray[j] = replaceChar
                    pinyinArray[i] = String(originalCharArray) + (toneNumber.toString())
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
        for(i in 0..ALL_MARKED_VOWEL_ARRAY.size) {
            var originalChar: Char = ALL_MARKED_VOWEL_ARRAY[i]
            var replaceChar: Char = ALL_UNMARKED_VOWEL_ARRAY[(i - i % 4) / 4]
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
        if(let Some(v) <- PINYIN_TABLE.get(c.toString())) {
            if(format.getName() == "FIRST_LETTER") {
                pinyinArray = formatPinyin(v, format)
                for(i in 0..pinyinArray.size) {
                   pinyinArray[i] = (pinyinArray[i].toRuneArray())[0].toString()
                }
            } else {
                pinyinArray = formatPinyin(v, format)
            }
        }
        return pinyinArray
    }

    static func convertToPinyinArrays(c: Char, format: PinyinFormat): Array<String> {  
        var pinyinArray: Array<String> = Array<String>()
        if(let Some(v) <- PINYIN_TABLE.get(c.toString())) {
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
    static func getWords(charArray: Array<Char>): Array<String> { 
        for(i in 1..math.min(charArray.size + 1, 6)) {
            let str = String(charArray.slice(0, i))
            match(MUTIL_PINYIN_TABLE.get(str)) {
                case None => continue
                case Some(_) => return [str]
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
        let charArray: Array<Char> = str.toRuneArray()
        if(charArray.size == 0) {
            throw Pinyin4cjException("Please enter a word or sentence")
        }
        var resultPinyinStrBuf: StringBuilder = StringBuilder()
        var (pos, i, strLen): (Int64, Int64, Int64) = (0, 0, charArray.size)
        while(i < strLen) {
            let sliCharArray = charArray.slice(i, strLen - i)
            var commonPrefixList: Array<String> = getWords(sliCharArray) 
            if(commonPrefixList.size == 0) {
                var c: Char = charArray[i]
                if(ChineseHelper.isChinese(c) || c == CHINESE_LING) {
                    var pinyinArray: Array<String> = convertToPinyinArrays(c, format)
                    if(pinyinArray.size > 0) {
                        if(format.getName() == "FIRST_LETTER"){
                            resultPinyinStrBuf.append((pinyinArray[0].toRuneArray())[0].toString() + (separator))
                            pos++
                        }else{
                            resultPinyinStrBuf.append(pinyinArray[0] + (separator))
                            pos++
                        }
                    }else{
                        resultPinyinStrBuf.append(c.toString())
                    }
                } else {
                    let index: Int64 = i
                    if(((index + 1) < strLen)) {
                        let next: Bool = ChineseHelper.isChinese(charArray[(index + 1)])
                        if(next) {
                            resultPinyinStrBuf.append(c.toString() + (separator))
                        } else {
                            resultPinyinStrBuf.append(c.toString())   
                        }
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
                        resultPinyinStrBuf.append((pinyinArray[j].toRuneArray())[0].toString() + (separator))
                        pos++
                    }else{
                        resultPinyinStrBuf.append(pinyinArray[j] + (separator))
                        pos++
                    }
                }
                i += words.toRuneArray().size
            }
        }
        
        return convertToPinyinStringResult(resultPinyinStrBuf, separator)
    }

    public static func convertToPinyinStringTraditional(str: String, separator: String, format: PinyinFormat): String {
        let string: String = ChineseHelper.convertToSimplifiedChinese(str)
        return convertToPinyinString(string, separator, format)
    }

    static func convertToPinyinStringResult(buf: StringBuilder, separator: String): String {
        var res: String = buf.toString()
        let charArray: Array<Char> = res.toRuneArray()
        if(separator.toRuneArray().size != 0 && (charArray[res.toRuneArray().size - 1].toString() == separator)) {
            let lastIndex: Int64 = res.lastIndexOf(separator.toArray()[0]).getOrThrow()
            res = res[..lastIndex]
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
            throw Pinyin4cjException("Please enter a Chinese character")
        } 
        var pinyin: String = PINYIN_TABLE[c.toString()]
        return pinyin.split(",").size > 1
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

    static func findArrayKeyByValue(ch: Char): Int64 {
        for(i in 0..ALL_MARKED_VOWEL_ARRAY.size) {
            if (ALL_MARKED_VOWEL_ARRAY[i] == ch) {
                return i
            }
        }
        return -1
        
    }

    /**
     * Character to Universal Pinyin
     *
     * @param char - Simplified or Traditional Characters
     * @return Array<String>
     */
    public static func toTongyongPinyinStringArray(char: Char): Array<String> {
        let pinyinArray: Array<String> = convertToPinyinArray(char, PinyinFormat.WITH_TONE_NUMBER)
        var res: Array<String> = Array<String>(pinyinArray.size, item: "")
        for(i in 0..pinyinArray.size) {
            var word: String = ""
            let num: String = pinyinArray[i][(pinyinArray[i].toRuneArray().size - 1)..]
            let pinyin: String = pinyinArray[i][..(pinyinArray[i].toRuneArray().size - 1)]
            match(TONGYONG_PINYIN_TABLE.get(pinyin)) {
                case None => word = pinyinArray[i]
                case Some(t) => word = t + (num)
            }
            res[i] = word
        }
        return res
    }
     
}