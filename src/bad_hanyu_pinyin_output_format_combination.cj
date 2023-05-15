
/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * An exception class indicates the wrong combination of pinyin output formats
 */
public class BadHanyuPinyinOutputFormatCombination <: Exception {
    init() {
        super()
    }
    public init(messages: String) {
        super(messages)
    }
}
