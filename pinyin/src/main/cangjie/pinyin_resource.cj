/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

package pinyin

import std.collection.HashMap

import ohos.file_fs.*
import ohos.hilog.Hilog

/*
 * Pinyin source data
 */
class PinyinResource {

    /*
     * Obtain Pinyin Source
     *
     * @return HashMap
     */
    static func getPinyinResource(): HashMap<String, String> {
        let map = HashMap<String, String>(22000)
        let readerIterator = FileFs.readLines("/data/storage/el1/bundle/entry/resources/resfile/pinyin.dict.txt")

        while (true) {
            var key: String = ""
            var value: String = ""
            var result = readerIterator.next()
            if(!result.done) {
                key = result.value
                result = readerIterator.next()
                if(!result.done) {
                    value = result.value
                    let isKeyCR = key.indexOf("\r").isSome() && key.indexOf("\n").isNone() // mac
                    let isKeyLF = key.indexOf("\n").isSome() && key.indexOf("\r").isNone()// unix
                    let isKeyCRLF = key.indexOf("\r\n").isSome() // windows

                    let isValueCR = value.indexOf("\r").isSome() && value.indexOf("\n").isNone() // mac
                    let isValueLF = value.indexOf("\n").isSome() && value.indexOf("\r").isNone()// unix
                    let isValueCRLF = value.indexOf("\r\n").isSome() // windows

                    if(isKeyCR && isValueCR) {
                        key = key.replace("\r", "")
                        value = value.replace("\r", "")
                    } else if(isKeyLF && isValueLF) {
                        key = key.replace("\n", "")
                        value = value.replace("\n", "")
                    } else {
                        key = key.replace("\r\n", "")
                        value = value.replace("\r\n", "")
                    }
                    map.add(key,value)

                } else {
                    break
                }
            } else {
                break
            }

        }
        return map
    }

    /*
     * Obtain MutilPinyin Source
     *
     * @return HashMap
     */
    static func getMutilPinyinResource() {
        return mutil_pinyin_dict
    }

    /*
     * Obtain Chinese Source
     *
     * @return HashMap
     */
    static func getChineseResource() {
        return chinese_dict
    }

    /*
     * Obtain TonyongPinyin Source
     *
     * @return HashMap
     */
    static func getTongyongPinyinResource() {
        return tongyong_pinyin_dict
    }

}