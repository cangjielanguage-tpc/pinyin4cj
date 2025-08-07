package pinyin

import ohos.ark_interop.*
import ohos.ark_interop_macro.*
import ohos.ark_interop_helper.*
import std.collection.HashMap
import ohos.hilog.Hilog

@Interop[ArkTS]
public class ChineseHelperArkts {
    public init(){}

    public func convertToSimplifiedChinese(str: String): String {
        return ChineseHelper.convertToSimplifiedChinese(str)
    }

    public func convertToTraditionalChinese(str: String): String {
        return ChineseHelper.convertToTraditionalChinese(str)
    }

    public func isTraditionalChinese(c: String): Bool {
        let s: Rune = c.toRuneArray()[0]
        return ChineseHelper.isTraditionalChinese(s)
    }

    public func isChinese(c: String): Bool {
        let s: Rune = c.toRuneArray()[0]
        return ChineseHelper.isChinese(s)
    }

    public func containsChinese(str: String): Bool {
        return ChineseHelper.containsChinese(str)
    }

    public func addChineseDictResource(dict: JSHashMapEx<String, String>): Unit {
        let temp: HashMap<String, String> = dict.toHashMap()
        var map: HashMap<Rune, Rune> = HashMap<Rune, Rune>()
        for ((k, v) in temp) {
            map.put(k.toRuneArray()[0], v.toRuneArray()[0])
        }
        ChineseHelper.addChineseDictResource(map)
    }
}


@Interop[ArkTS]
public class PinyinHelperArkts {
    public init(){}

    public func convertToPinyinArray(c: String, format: String): JSArrayEx<String> {
        let temp: Array<String> = PinyinHelper.convertToPinyinArray(c.toRuneArray()[0], PinyinFormat.fromString(format))
        return JSArrayEx<String>(temp)
    }

    public func convertToPinyinStringFormat(str: String, separator: String, format: String): String {
        return PinyinHelper.convertToPinyinString(str, separator, PinyinFormat.fromString(format))
    }

    public func convertToPinyinStringTraditional(str: String, separator: String, format: String): String {
        return PinyinHelper.convertToPinyinStringTraditional(str, separator, PinyinFormat.fromString(format))
    }

    public func convertToPinyinString(str: String, separator: String): String {
        return PinyinHelper.convertToPinyinString(str, separator)
    }

    public func getShortPinyin(str: String): String {
        return PinyinHelper.getShortPinyin(str)
    }

    public func hasMultiPinyin(char: String): Bool {
        return PinyinHelper.hasMultiPinyin(char.toRuneArray()[0])
    }

    public func addPinyinDictResource(dict: JSHashMapEx<String, String>): Unit {
        let temp: HashMap<String, String> = dict.toHashMap()
        PinyinHelper.addPinyinDictResource(temp)
    }

    public func addMutilPinyinDictResource(dict: JSHashMapEx<String, String>): Unit {
        let temp: HashMap<String, String> = dict.toHashMap()
        PinyinHelper.addMutilPinyinDictResource(temp)
    }

    public func toTongyongPinyinStringArray(char: String): JSArrayEx<String> {
        let temp: Array<String> = PinyinHelper.toTongyongPinyinStringArray(char.toRuneArray()[0])
        return JSArrayEx<String>(temp)
    }
}