# Pinyin4cj库

## 介绍

Pinyin4cj 是一个支持将汉字转换成拼音的三方库，输出的拼音格式可以自定义设置。

## 1 中文转换到汉语拼音，支持多音字

前置条件：NA 

场景：

1. 支持词、句转换成拼音
2. 支持常用简体/繁体中文字符转换成拼音
3. 支持常见多音字符转换成拼音
4. 支持Unicode格式的字符ü、支持声调符号、支持首字母格式
5. 支持常用简体、繁体中文字符互转
6. 支持添加自定义字典
7. 支持通用拼音

约束：在词库中包含文字才能转换，字符 ü、声调符号、首字母只对汉语拼音有效

依赖：

1. 需要 txt 文件解析

性能：支持版本几何性能持平

可靠性：NA

### 1.1 主要接口

#### 1.1.1 ChineseHelper

```
export declare class ChineseHelper {

    /**
     * 将包含繁体的字符串转换成简体字符串,非汉字原样返回
     * 若有些繁体字转换不成预期的简体字，用户可自定义中文词典
     * 
     * 参数 str - 要转换的字符串
     * 返回值 string - 返回转换后的简体字符串
     *                若 str 为简体字符串，返回结果为它本身
     *                若 str 为空字符串，返回结果为空字符串
     */
    convertToSimplifiedChinese(str: string): string 

    /**
     * 将包含简体的字符串转换成繁体字符串,非汉字原样返回 
     * 若有些简体字转换不成预期的繁体字，用户可自定义中文词典
     *
     * 参数 str - 要转换的字符串
     * 返回值 string - 返回转换后的繁体字符串
     *                若 str 为繁体字符串，返回结果为它本身
     *                若 str 为空字符串，返回结果为空字符串
     */
    convertToTraditionalChinese(str: string): string

    /**
     * 判断字符是否是繁体字
     *
     * 参数 c - 字符
     * 返回值 boolean
     */
    isTraditionalChinese(c: string): boolean

    /**
     * 判断字符是否是汉字
     *
     * 参数 c - 字符
     * 返回值 boolean
     */
    isChinese(c: string): boolean

    /**
     * 判断字符串是否包含汉字
     *
     * 参数 str - 字符串
     * 返回值 boolean
     */
    containsChinese(str: string): boolean

    /**
     * 用户添加自定义中文字典
     *
     * 参数 dict - 添加中文字典
     * 返回值 void
     */
    addChineseDictResource(dict: Map<string, string>): void
}
```

#### 1.1.2 PinyinHelper

```
export declare class PinyinHelper {

    /**
     * 常用多音字转换成拼音集合
     * 
     * 参数 c - 字符
     * 参数 format - 输出格式
     * 返回值 Array<string> 
     *   - 若 c 为非汉字字符，返回 []
     */
    public static func convertToPinyinArray(c: string, format: PinyinFormat): Array<string>
    
    /**
     * 将包含多音字或简体字的词或句转成指定拼音格式的拼音，按分隔符隔开，非汉字原样返回
     * 若有些字拼音没有达到预期效果，用户可自定义拼音词典
     * 
     * 参数 str - 要转换的字符串
     * 参数 separator - 分隔符
     * 参数 format - 输出拼音格式
     * 返回值 string - 返回转换后的拼音字符串
     *   - 若 str 为空字符串，hilog - Please enter a word or sentence  
     */
    public static func convertToPinyinStringFormat(str: string, 
                                            separator: string, 
                                            format: PinyinFormat): string

    /**
     * 将包含多音字或繁体字的词或句转成拼音，按分隔符隔开，非汉字原样返回
     * 若有些字拼音没有达到预期效果，用户可自定义拼音词典
     * 
     * 参数 str - 要转换的字符串
     * 参数 separator - 分隔符
     * 返回值 string - 返回转换后的拼音字符串
     *   - 若 str 为空字符串，hilog - Please enter a word or sentence     
     */
    public static func convertToPinyinString(str: string, separator: string): string
    
    
    /**
     * 将包含多音字或繁体字的词或句转成指定拼音格式的拼音，按分隔符隔开，非汉字原样返回
     * 若有些字拼音没有达到预期效果，用户可自定义拼音词典
     * 
     * 参数 str - 要转换的字符串
     * 参数 separator - 分隔符
     * 参数 format - 输出拼音格式
     * 返回值 string - 返回转换后的拼音字符串
     *   - 若 str 为空字符串，hilog - Please enter a word or sentence  
     */
    public static func convertToPinyinStringTraditional(str: string, 
                                                        separator: string, 
                                                        format: PinyinFormat): string
                                                        
    /**
     * 获取词句首字母格式的拼音
     *
     * 参数 str - 字符串
     * 返回值 string
     *   - 若 str 为空字符串，hilog - Please enter a word or sentence  
     */
    public static func getShortPinyin(str: string): string

    /**
     * 判断字符是否为多音字
     *
     * 参数 c - 字符
     * 返回值 boolean
     */
    public static func hasMultiPinyin(c: string): boolean
    
    /**
     * 用户添加自定义拼音字典
     * 
     * 参数 dict - 添加拼音字典
     * 返回值 void
     */
    public static func addPinyinDictResource(dict: HashMap<string, string>): void

    /**
     * 用户添加自定义拼音组合字典
     * 
     * 参数 dict - 添加拼音组合字典
     * 返回值 void
     */
    public static func addMutilPinyinDictResource(dict: HashMap<string, string>): void
    
    /**
     * 获取单个汉字（简体和繁体）的数字音标的通用拼音
     * 
     * 参数 char - 字符
     * 返回值 Array<string> 
     *        - 是汉字返回通用拼音
     *        - 不是汉字返回 []
     */
    public static func toTongyongPinyinStringArray(char: string): Array<string>

```
#### 1.1.4 PinyinFormat

定义输出汉语拼音格式

| 格式 | 结果 | 
| --------- | -----|
|  WITH_TONE_MARK   | lǚ   |
|  WITHOUT_TONE     | lü   |
|  WITH_TONE_NUMBER | lü3  |
|  FIRST_LETTER     | l    |

### 1.2 示例

```ets
import { ChineseHelper, PinyinFormat, PinyinHelper } from '@cangjie-tpc/pinyin'
import { hilog } from '@kit.PerformanceAnalysisKit'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Column(){
        Row(){
          Button("convertToPinyinStringFormat")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin = c.convertToPinyinStringFormat("河南麥收季遇10年最嚴重“爛場雨”，灾情如何？怎樣應對？", " ", "WITH_TONE_MARK")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })                    
      }
    }
    .height('100%')
    .width('100%')
  }
}
```