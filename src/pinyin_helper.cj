/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * A class provides several utility functions to convert Chinese characters
 * (both Simplified and Tranditional) into various Chinese Romanization
 * representations
 */
public class PinyinHelper {

    /**
     * Word or sentence to pinyin
     * 
     * @param str - Word or sentence
     * @param outputFormat - The required format of the returned Chinese Pinyin string
     * @param separate - Delimiter, attached after a Chinese character 
     *                   (excluding the last Chinese character at the end of 
     *                   a sentence and non Chinese characters)
     * @param retain - Do you want to keep characters that cannot be converted to pinyin characters
     * @return String - A string in which all Chinese characters are replaced by their corresponding
     *                  Pinyin representation
     */
    static public func toHanYuPinyinString(str: String, outputFormat: HanyuPinyinOutputFormat,
                                            separate: String, retain: Bool): String {
        if(str.size == 0) {
            throw Exception("Provide words or sentences to be converted")
        }
        var resource: ChineseToPinyinResource = ChineseToPinyinResource.getInstance()
        var resultPinyinStrBuf: StringBuilder = StringBuilder()
        var chars: Array<Char> = str.toCharArray()

        var k: Int64 = 0
        do {
            var result: String = ""//Longest result matched
            var ch: Char = chars[k]
            var currentTrie: Option<Trie> = resource.getUnicodeToHanyuPinyinTable()
            var success: Int64 = k
            var current: Int64 = k
            do {
                let hexStr: String = UInt32(ch).format("0x").toUpper()
                currentTrie = currentTrie.getOrThrow().get(hexStr)
                if(let Some(t) = currentTrie) {
                    if (t.getPinyin() != "") {
                        result = t.getPinyin()
                        success = current
                    }
                    currentTrie = t.getNextTire()
                }
                current++
                if (current < chars.size) {
                    ch = chars[current]
                }else {
                    break
                } 
                match(currentTrie) {
                    case None => break
                    case Some(t) => ()      
                }       
            } while (true)

            /*
             * If there is no match in the prefix tree, it cannot be converted to pinyin 
             * and can be directly output or removed
            */
            if (result == "") {
                if (retain) {
                    resultPinyinStrBuf.append(chars[k])
                } 
            } else {
                var pinyinStrArray: Array<String> = resource.parsePinyinString(result)
                if (pinyinStrArray.size != 0) {
                    var n: Int64 = 0
                    do {
                        resultPinyinStrBuf.append(PinyinFormatter.formatHanyuPinyin(pinyinStrArray[n], outputFormat))
                        //Not the last one, (nor the last one in Pinyin, and not the last one to match successfully)
                        if (current < chars.size || (n < pinyinStrArray.size - 1 && k != success)) {
                            resultPinyinStrBuf.append(separate)
                        }
                        if (k == success) {
                            break
                        }
                        n++ 
                    } while(n < pinyinStrArray.size)
                }
            }
            k = success
            k++
        }while(k < chars.size)

        return resultPinyinStrBuf.toString()
    }
}
