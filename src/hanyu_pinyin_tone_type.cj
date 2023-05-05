/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */
 
package pinyin4cj

/**
 * Define the output format of Hanyu Pinyin tones
 * 
 * <p>
 * Chinese has four pitched tones and a "toneless" tone. They are called Píng(平,
 * flat), Shǎng(上, rise), Qù(去, high drop), Rù(入, drop) and Qing(轻, toneless).
 * Usually, we use 1, 2, 3, 4 and 5 to represent them.
 */
public class HanyuPinyinToneType {

    /**
     * The option indicates that hanyu pinyin is outputted with tone numbers
     */
    public static var  WITH_TONE_NUMBER: HanyuPinyinToneType = HanyuPinyinToneType("WITH_TONE_NUMBER")

    /**
     * The option indicates that hanyu pinyin is outputted without tone numbers
     * or tone marks
     */
    public static var  WITHOUT_TONE: HanyuPinyinToneType = HanyuPinyinToneType("WITHOUT_TONE")

    /**
     * The option indicates that hanyu pinyin is outputted with tone marks 
     */
    public static var  WITH_TONE_MARK: HanyuPinyinToneType = HanyuPinyinToneType("WITH_TONE_MARK")

    protected var name: String = ""

    protected init(name: String){
        setName(name)
    }

    public func getName(): String {
        return name
    }

    protected func setName(name: String): Unit{
        this.name = name
    } 
}
