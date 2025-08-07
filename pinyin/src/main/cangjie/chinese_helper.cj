/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

package pinyin

import std.collection.HashMap
import ohos.hilog.Hilog

let CHINESE_MAP: HashMap<Rune, Rune> = PinyinResource.getChineseResource()

/**
 * Conversion of Simplified and Traditional Chinese Characters
 */
public class ChineseHelper {

    /*
     * Convert a single Traditional Chinese character to Simplified Chinese
     *
     * @param c - Single Traditional Chinese Character
     * @return Rune - Simplified Chinese
     */
    static func convertCharToSimplifiedChinese(c: Rune): Rune {
        var simplifiedChinese: Rune = r'a'
        try {
            simplifiedChinese = CHINESE_MAP[c]
        } catch (e: NoneValueException) {
            return c
        }
        return simplifiedChinese
    }

    /*
     * Convert individual simplified characters to traditional characters
     *
     * @param c - Single simplified Chinese Character
     * @return Rune - traditional Chinese
     */
    static func convertCharToTraditionalChinese(c: Rune): Rune {
        for ((key, _) in CHINESE_MAP) {
            if (CHINESE_MAP[key] == c) {
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
        let charArray: Array<Rune> = str.toRuneArray()
        for (i in 0..charArray.size) {
            var c: Rune = charArray[i]
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
        let data: Array<Byte> = unsafe { str.rawData() }
        let sb = StringBuilder()
        var i: Int64 = 0
        while (i < str.size) {
            var (r, utf8Size) = Rune.fromUtf8(data, i)
            i += utf8Size
            sb.append(convertCharToTraditionalChinese(r))
        }

        return sb.toString()
    }

    /**
     * Determine whether it is a traditional Chinese character
     *
     * @param c - Chinese character
     * @return Bool - true: It's a traditional Chinese character
     *                false: Not Traditional Chinese Characters
     */
    public static func isTraditionalChinese(c: Rune): Bool {
        try {
            CHINESE_MAP[c]
        } catch (e: NoneValueException) {
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
    public static func isChinese(c: Rune): Bool {
        var flagC: Bool = false
        if (PINYIN_TABLE.contains(c.toString())) {
            flagC = true
        }

        return flagC
    }

    /**
     * Determine whether a string contains Chinese characters
     *
     * @param str - A string
     * @return Bool - true: Contains Chinese characters
     *                false: Does not contain Chinese characters
     */
    public static func containsChinese(str: String): Bool {
        let charArray: Array<Rune> = str.toRuneArray()
        for (i in 0..charArray.size) {
            if (isChinese(charArray[i])) {
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
    public static func addChineseDictResource(dict: HashMap<Rune, Rune>): Unit {
        CHINESE_MAP.putAll(dict)
    }
}
