/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * Manage all external resources required in PinyinHelper class.
 */
class ChineseToPinyinResource {

    private var unicodeToHanyuPinyinTable: Trie = Trie()

    private func setUnicodeToHanyuPinyinTable(unicodeToHanyuPinyinTable: Trie): Unit {
        this.unicodeToHanyuPinyinTable = unicodeToHanyuPinyinTable
    }

    func getUnicodeToHanyuPinyinTable(): Trie {
        return unicodeToHanyuPinyinTable
    }

    init() {
        initializeResource()
    }

    private func initializeResource(): Unit {
        var getFilePath: Path = getFilePath()
        try {
            let resourceName: String = getFilePath.join("resource").join("unicode_to_hanyu_pinyin.txt").toString()
            let resourceMultiName: String = getFilePath.join("resource").join("multi_pinyin.txt").toString()
 
            setUnicodeToHanyuPinyinTable(Trie())
            getUnicodeToHanyuPinyinTable().load(ResourceHelper.getResourceInputStream(resourceName))
            getUnicodeToHanyuPinyinTable().loadMultiPinyin(ResourceHelper.getResourceInputStream(resourceMultiName))

        } catch (e: Exception) {
            throw e
        }
    }

    func parsePinyinString(pinyinRecord: String): Array<String> {
        if (pinyinRecord != "") {
            let indexOfLeftBracket: Int64 = pinyinRecord.indexOf(Field.LEFT_BRACKET).getOrThrow()
            let indexOfRightBracket: Int64= pinyinRecord.lastIndexOf(Field.RIGHT_BRACKET).getOrThrow()

            var stripedString: String = pinyinRecord.substring(
                                        indexOfLeftBracket + 
                                        Field.LEFT_BRACKET.size,
                                        pinyinRecord.size - 2)
         
            return stripedString.split(Field.COMMA)
        }
        return Array<String>() // no record found or mal-formatted record
    }

    static func getInstance(): ChineseToPinyinResource {
        return ChineseToPinyinResourceHolder.theInstance
    }

    func getHanyuPinyinStringArray(ch: Char): Array<String> {
        let pinyinRecord: String = getHanyuPinyinRecordFromChar(ch)
        return parsePinyinString(pinyinRecord)
    }

    private func getHanyuPinyinRecordFromChar(ch: Char): String {
        let codepointHexStr: String = UInt32(ch).format("0x").toUpper()
        let trie: ?Trie = getUnicodeToHanyuPinyinTable().get(codepointHexStr)
        var foundRecord: String = ""
        if (let Some(t) = trie) {
            foundRecord = trie.getOrThrow().getPinyin()
        } 
        if(isValidRecord(foundRecord)) {
            return foundRecord
        }
        return ""
    }

    private func isValidRecord(record: String): Bool {
        let noneStr: String = "(none0)"
        return (record != "") &&
            !record.equals(noneStr) &&
            record.startsWith(Field.LEFT_BRACKET) && 
            record.endsWith(Field.RIGHT_BRACKET)
    }
}

class ChineseToPinyinResourceHolder {
    static var theInstance: ChineseToPinyinResource = ChineseToPinyinResource()
}

class Field {
    static var LEFT_BRACKET: String = "("

    static var RIGHT_BRACKET: String = ")"

    static var COMMA: String = ","
}
