//3rd_party_lib:pinyin4cj/build/pinyin4cj

import std.unittest.*
import std.unittest.testmacro.*
import pinyin4cj.*
import std.collection.*

@Test
public class pinyin_addMutilPinyinDictResource_001 {
    @TestCase
    public func pinyin_addMutilPinyinDictResource_001():Unit{
        var str = PinyinHelper.convertToPinyinString("答理", " ")
        println("str = ${str}")
        @Assert(str,"dá lǐ")   

        let map: HashMap<String, String> = HashMap<String, String>([("答理", "dālǐ")])
        PinyinHelper.addMutilPinyinDictResource(map)
        str = PinyinHelper.convertToPinyinString("答理答理", " ")
        println("str = ${str}")
        @Assert(str,"dālǐ dālǐ")      
    }
}