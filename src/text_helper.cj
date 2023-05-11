package pinyin4cj

class TextHelper {

    static func extractToneNumber(hanyuPinyinWithToneNumber: String): String {
        return hanyuPinyinWithToneNumber.substring(hanyuPinyinWithToneNumber.size - 1)
    }

    static func extractPinyinString(hanyuPinyinWithToneNumber: String): String {
        return hanyuPinyinWithToneNumber.substring(0, hanyuPinyinWithToneNumber.size - 1)
    }

}
