/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import regex.*

let CHINESE_REGEX: Regex = Regex("^[\u{4e00}-\u{9fa5}]+$")
let CHINESE_SYMBOL: Regex = Regex("[^\u{3002}\u{201c}\u{201d}\u{3001}]+$")
let CHINESE_MAP: HashMap<Char, Char> = PinyinResource.getChineseResource()

/**
 * Conversion of Simplified and Traditional Chinese Characters
 */
public class ChineseHelper {
    
    /*
     * Convert a single Traditional Chinese character to Simplified Chinese
     *
     * @param c - Single Traditional Chinese Character
     * @return Char - Simplified Chinese
     */
    static func convertCharToSimplifiedChinese(c: Char): Char {  
        var simplifiedChinese: Char = 'a'
        try {
            simplifiedChinese = CHINESE_MAP[c]
        }catch(e: Exception) {
            return c
        }
        return simplifiedChinese
    }

    /*
     * Convert individual simplified characters to traditional characters
     *
     * @param c - Single simplified Chinese Character
     * @return Char - traditional Chinese
     */
    static func convertCharToTraditionalChinese(c: Char): Char {
        for((key, v) in CHINESE_MAP) {
            if(CHINESE_MAP[key] == c) {
                return key
            }
        }
        return c
    }

    /**
     * Convert Traditional Chinese to Simplified Chinese
     *
     * @param str - Traditional Chinese
     * @return String - Simplified Chinese
     */
    public static func convertToSimplifiedChinese(str: String): String {
        var result: String = ""
        for(i in 0..str.size) {
            var c: Char = str.get(i).getOrThrow()
            result += convertCharToSimplifiedChinese(c).toString()
        }
        return result
    }

    /**
     * Convert Simplified Chinese to Traditional Chinese
     *
     * @param str - Simplified Chinese
     * @return String - Traditional Chinese
     */
    public static func convertToTraditionalChinese(str: String): String {
        var result: String = ""
        for(i in 0..str.size) {
            var c: Char = str.get(i).getOrThrow()
            result += convertCharToTraditionalChinese(c).toString()
        }
        return result
    }

    /**
     * Determine whether it is a traditional Chinese character
     *
     * @param c - Chinese character
     * @return Bool - true: It's a traditional Chinese character
     *                false: Not Traditional Chinese Characters  
     */
    public static func isTraditionalChinese(c: Char): Bool {
        try {
            CHINESE_MAP[c]
        }catch(e: Exception) {
            return false
        }
        return true
    }

    /**
     * Determine whether it is a Chinese character
     *
     * @param c - Chinese character
     * @return Bool - true: It's a Chinese character
     *                false: Not Chinese Characters  
     */
    public static func isChinese(c: Char): Bool {
        var flagC: Bool = match (CHINESE_REGEX.matches(c.toString())) {
            case Some(r) => true
            case None => false
        }
        var flagS: Bool = match (CHINESE_SYMBOL.matches(c.toString())) {
            case Some(r) => true
            case None => false
        }
        return '〇' == c || (flagC && flagS)
    }

    /**
     * Determine whether a string contains Chinese characters
     *
     * @param str - A string
     * @return Bool - true: Contains Chinese characters
     *                false: Does not contain Chinese characters  
     */
    public static func containsChinese(str: String): Bool {
        for(i in 0..str.size) {
            if(isChinese(str.get(i).getOrThrow())){
                return true
            }
        }
        return false
    }

    /**
     * Add custom Chinese dictionary
     *
     * @param dict - Chinese dictionary
     * @return Unit
     */
    public static func addChineseDictResource(dict: HashMap<Char, Char>): Unit {
        CHINESE_MAP.putAll(dict)
    }
}