/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * Define the output format of character 'ü'
 * 
 * 'ü' is a special character of Hanyu Pinyin, which can not be simply
 * represented by English letters. In Hanyu Pinyin, such characters include 'ü',
 * 'üe', 'üan', and 'ün'.
 * 
 */
public class HanyuPinyinVCharType {

    /**
     * The option indicates that the output of 'ü' is "u:"
     */
    public static var WITH_U_AND_COLON: HanyuPinyinVCharType = HanyuPinyinVCharType("WITH_U_AND_COLON")

    /**
     * The option indicates that the output of 'ü' is "v"
     */
    public static var WITH_V: HanyuPinyinVCharType = HanyuPinyinVCharType("WITH_V")

    /**
     * The option indicates that the output of 'ü' is "ü" in Unicode form
     */
    public static var  WITH_U_UNICODE: HanyuPinyinVCharType = HanyuPinyinVCharType("WITH_U_UNICODE")

    protected var name: String = ""
    
    protected init(name: String){
        setName(name)
    }

    public func getName(): String{
        return name
    }
    protected func setName(name: String): Unit {
        this.name = name
    }   
}
