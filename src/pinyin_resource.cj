/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

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
        var getFilePath: Path = getFilePath()
        let resourceName: String = getFilePath.join("pinyin.dict.txt").toString()
        if(!File.exists(resourceName)) {
            throw Pinyin4cjException("The pinyin.dict.txt file does not exist")
        }
        let file: File = File(resourceName, Open(true, false)) 
        let map = HashMap<String, String>(22000)
        var bufferedReader: StringReader<File> = StringReader(file)
        while (true) {
            match (bufferedReader.readln()) {
                case None => break
                case Some(key) => 
                    match (bufferedReader.readln()) {
                        case None => throw Pinyin4cjException("Invalid value")
                        case Some(value) => 
                            map.put(key,value)
                    }
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