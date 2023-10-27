/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * Pinyin exception information processing class
 */
public class Pinyin4cjException <: Exception {
    private var messages: String = ""
    public init() {
        super()
    }
    public init(messages: String) {
        super(messages)
        this.messages = messages
    }
    public func getMessage(): String {
        return messages
    }
    public override func toString(): String {
        return "Pinyin4cjException: ${messages}"
    }
}