// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import pinyin4cj.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*


main() {
    let testPinyinHelper = TestPinyinHelper()
    testPinyinHelper.test1()
    testPinyinHelper.test2()
    return 0
}

@Test
public class TestPinyinHelper {
    @TestCase
    public func test1(): Unit {
        @Assert("ān,bù,dāng,chē", PinyinHelper.convertToPinyinString("安步当车", ","))
    }

    @TestCase
    public func test2(): Unit {
        let map: HashMap<String, String> = HashMap<String, String>([("安步当车","ān,bù,dàng,chē")])
        PinyinHelper.addMutilPinyinDictResource(map)
        @Assert("ān,bù,dàng,chē", PinyinHelper.convertToPinyinString("安步当车", ","))
    }

}
