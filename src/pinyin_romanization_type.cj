
/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * The class describes variable Chinese Pinyin Romanization System
 * 
 */
class PinyinRomanizationType {
    /**
     * Hanyu Pinyin system
     */
    static let HANYU_PINYIN: PinyinRomanizationType = PinyinRomanizationType("Hanyu")

    /**
     * Tongyong Pinyin system
     */
    static let TONGYONG_PINYIN: PinyinRomanizationType = PinyinRomanizationType("Tongyong")

    protected var tagName: String = ""
    
    protected init(tagName: String) {
        setTagName(tagName)
    }

    func getTagName(): String {
        return tagName
    }

    protected func setTagName(tagName: String): Unit {
        this.tagName = tagName
    }
}
