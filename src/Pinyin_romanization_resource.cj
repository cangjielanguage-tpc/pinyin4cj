package pinyin4cj

from encoding import xml.*

class PinyinRomanizationResource {
   /**
    * A DOM model contains variable pinyin presentations
    */
    private var pinyinMappingDoc: ?XmlElement = XmlElement("Hanyu", "a")

    private func setPinyinMappingDoc(pinyinMappingDoc: XmlElement): Unit {
        this.pinyinMappingDoc = pinyinMappingDoc
    }

    func getPinyinMappingDoc(): ?XmlElement {
        return pinyinMappingDoc
    }

    init() {
        initializeResource()
    }

    /**
     * Initialiez a DOM contains variable PinYin representations
     */
    private func initializeResource(): Unit {
        var getFilePath: Path = getFilePath()
        try {
            let mappingFileName: String = getFilePath.join("resource").join("pinyin_mapping.xml").toString()

            // Parse file to XML Document
            var f: File = ResourceHelper.getResourceInputStream(mappingFileName)

            var bufferedReader: StringReader = StringReader(f)
            let res: String = bufferedReader.readToEnd()
 
            match(XmlParser().parse(res)) {
                case Some(x) => setPinyinMappingDoc(x)
                case None => ()
            }
            
        } catch (ex: Exception) {
            throw ex
        } 
    }

    static func getInstance(): PinyinRomanizationResource {
        return PinyinRomanizationSystemResourceHolder.theInstance
    }  
}

class PinyinRomanizationSystemResourceHolder {
    static let theInstance: PinyinRomanizationResource = PinyinRomanizationResource()
}