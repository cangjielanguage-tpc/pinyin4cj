/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

/**
 * pinyin4j is free software you can redistribute it and/or modify 
 * it under the terms of the GNU General Public License as published by 
 * the Free Software Foundation either version 2 of the License, or 
 * (at your option) any later version. 
 */
public class HanyuPinyinCaseType {

    /**
     * The option indicates that hanyu pinyin is outputted as uppercase letters
     */
    public static var UPPERCASE: HanyuPinyinCaseType = HanyuPinyinCaseType("UPPERCASE")

    /**
     * The option indicates that hanyu pinyin is outputted as lowercase letters
     */
    public static var LOWERCASE: HanyuPinyinCaseType = HanyuPinyinCaseType("LOWERCASE")

    protected var name: String = ""

    protected init(name: String){
        setName(name)
    }

    public func getName(): String {
        return name
    }

    protected func setName(name: String): Unit {
        this.name = name
    } 
}
