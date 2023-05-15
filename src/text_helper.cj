package pinyin4cj

/**
 * Contains the utility functions supporting text processing
 */
class TextHelper {

    /**
     * get pinyin
     *
     * @param hanyuPinyinWithToneNumber - Pinyin with tone
     * @return String - Hanyu Pinyin string without tone number
     */
    static func extractToneNumber(hanyuPinyinWithToneNumber: String): String {
        return hanyuPinyinWithToneNumber.substring(hanyuPinyinWithToneNumber.size - 1)
    }

    /**
     * get tone
     *
     * @param hanyuPinyinWithToneNumber - Pinyin with tone
     * @return String - only tone number
     */
    static func extractPinyinString(hanyuPinyinWithToneNumber: String): String {
        return hanyuPinyinWithToneNumber.substring(0, hanyuPinyinWithToneNumber.size - 1)
    }

}
