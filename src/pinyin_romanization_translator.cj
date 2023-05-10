package pinyin4cj

class PinyinRomanizationTranslator {
  /**
   * convert the given unformatted Pinyin string from source Romanization
   * system to target Romanization system
   * 
   * @param sourcePinyinStr
   *            the given unformatted Pinyin string
   * @param sourcePinyinSystem
   *            the Romanization system which is currently used by the given
   *            unformatted Pinyin string
   * @param targetPinyinSystem
   *            the Romanization system that should be converted to
   * @return unformatted Pinyin string in target Romanization system null if
   *         error happens
   */
    static func convertRomanizationSystem(
        sourcePinyinStr: String,
        sourcePinyinSystem: PinyinRomanizationType, 
        targetPinyinSystem: PinyinRomanizationType
    ): String {
    let pinyinString: String = TextHelper.extractPinyinString(sourcePinyinStr)
    let toneNumberStr: String = TextHelper.extractToneNumber(sourcePinyinStr)

    // return value
    var targetPinyinStr: String = ""
    try {
      // find the node of source Pinyin system
        let sourceType: String = sourcePinyinSystem.getTagName()
        let targetType: String = targetPinyinSystem.getTagName()
        let pinyinMappingDoc: XmlElement = PinyinRomanizationResource.getInstance().getPinyinMappingDoc().getOrThrow()
        let childNum: Int64 = pinyinMappingDoc.childrenNum
        let child: ArrayList<XmlElement> = pinyinMappingDoc.childrenElements
        var targetNum: Int64 = 0
        for(i in 0..childNum) {
            let childs: ArrayList<XmlElement> = child[i].childrenElements
            let childsNum: Int64 = child[i].childrenNum
            for(j in 0..childsNum) {
                if(childs[j].name.equals(sourceType) && childs[j].content.equals(pinyinString)) {
                    targetNum = i   
                    break                 
                }
            }
        }
        // target tongyong
        let targetTongYong: ArrayList<XmlElement> = child[targetNum].childrenElements
        targetPinyinStr = targetTongYong[4].content 
        targetPinyinStr = targetPinyinStr + toneNumberStr
         
    } catch (e: Exception) {
        println(e.toString())
    }
    return targetPinyinStr
    }
}
