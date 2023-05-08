# Pinyin4cj库

## 介绍

Pinyin4j 是一个支持将汉字转换成拼音的三方库，输出的拼音格式可以自定义设置。

## 1 中文转换到汉语拼音/通用拼音，支持 Unicode 格式的字符 ü、声调符号和大小写格式输出

前置条件：NA 

场景：

1. 支持常用简体/繁体中文字符转换成拼音
2. 支持常见多音字转换成拼音
3. 支持词、句转换成拼音
4. 支持转换通用拼音
5. 支持 Unicode 格式的字符 ü、支持声调符号、支持大小写

约束：在词库中包含文字才能转换，字符ü、声调符号、大小写只对汉语拼音有效

依赖：

1. 需要 xml 文件解析/txt 文件解析

性能：支持版本几何性能持平

可靠性：NA

### 1.1 支持词、句转换成拼音

可以输入词语或者句子，将可识别的汉字转换成拼音格式。

#### 1.1.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 词句转拼音
     * 
     * 参数 str - 要转换的词或句
     * 参数 outputFormat - 返回的汉语拼音字符串的所需格式
     * 参数 separate - 分隔符，附在汉字后面（不包括句尾最后一个汉字和非汉字）
     * 参数 retain - 是否保留无法转换为拼音字符的字符
     * 返回值 String - 返回转换后的拼音
     */
    static public func toHanYuPinyinString(str: String, 
                                           outputFormat: HanyuPinyinOutputFormat,
                                           separate: String, 
                                           retain: Bool): String 
}
```

#### 1.1.2 示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("草长莺飞", defaultFormat, ",", false)
    println(pinyinArray)
    return 0
}
```
执行结果如下：

```
căo,zhăng,yīng,fēi
```

## 2 其他接口

### 2.1 HanyuPinyinVCharType

定义字符 ü 的输出格式

```cangjie
public class HanyuPinyinVCharType {

    /**
     * ü 的输出为 u：
     */
    public static var WITH_U_AND_COLON: HanyuPinyinVCharType = HanyuPinyinVCharType("WITH_U_AND_COLON")

    /**
     * ü 的输出为 v
     */
    public static var WITH_V: HanyuPinyinVCharType = HanyuPinyinVCharType("WITH_V")

    /**
     * ü 的输出为 ü
     */
    public static var  WITH_U_UNICODE: HanyuPinyinVCharType = HanyuPinyinVCharType("WITH_U_UNICODE")

    /**
     * 获取字符的输出格式
     *
     * 返回值 String
     */
    public func getName(): String  
}
```

### 2.2 HanyuPinyinCaseType

定义汉语拼音输出为大小写字母

```cangjie
public class HanyuPinyinCaseType {

    /**
     * 汉语拼音输出为大写字母
     */
    public static var UPPERCASE: HanyuPinyinCaseType = HanyuPinyinCaseType("UPPERCASE")

    /**
     * 汉语拼音输出为小写字母
     */
    public static var LOWERCASE: HanyuPinyinCaseType = HanyuPinyinCaseType("LOWERCASE")

    /**
     * 获取字符的输出格式
     *
     * 返回值 String
     */
    public func getName(): String
}
```
### 2.3 HanyuPinyinToneType

定义汉语拼音的声调输出格式

```cangjie
public class HanyuPinyinToneType {

    /**
     * 该选项表示汉语拼音输出时带有声调数字
     * 用 1、2、3、4、5 表示 阴平（ˉ）、阳平（ˊ）、上声（ˇ）去声（ˋ）、轻声（不标调）
     */
    public static var  WITH_TONE_NUMBER: HanyuPinyinToneType = HanyuPinyinToneType("WITH_TONE_NUMBER")

    /**
     * 该选项表示输出的汉语拼音没有声调数字或声调标记
     */
    public static var  WITHOUT_TONE: HanyuPinyinToneType = HanyuPinyinToneType("WITHOUT_TONE")

    /**
     * 该选项表示汉语拼音输出时带有声调标记，例 ā á ǎ à
     */
    public static var  WITH_TONE_MARK: HanyuPinyinToneType = HanyuPinyinToneType("WITH_TONE_MARK")

    /**
     * 获取字符的输出格式
     *
     * 返回值 String
     */
    public func getName(): String
}
```

### 2.4 HanyuPinyinOutputFormat

定义如何输出汉语拼音格式

汉语拼音输出为小写字母

| Combination | WITH_U_AND_COLON | WITH_V|WITH_U_UNICODE |
| --------- | -----|----- |---- |
|  WITH_TONE_NUMBER | lu:3            |lv3             |lü3 |
|  WITHOUT_TONE     | lu:             |lv              |lü  |
|  WITH_TONE_MARK   | throw BadHanyuPinyinOutputFormatCombination |throw Exception |lǚ  |

汉语拼音输出为大写字母
| Combination | WITH_U_AND_COLON | WITH_V|WITH_U_UNICODE |
| --------- | -----|----- |---- |
|  WITH_TONE_NUMBER | LU:3            |LV3             |LÜ3 |
|  WITHOUT_TONE     | LU:             | LV             |LÜ  |
|  WITH_TONE_MARK   | throw BadHanyuPinyinOutputFormatCombination |throw Exception |LǙ  |

```cangjie

public class HanyuPinyinOutputFormat {

    /**
     * 初始化汉语拼音输出格式
     * - HanyuPinyinVCharType.WITH_U_AND_COLON
     * - HanyuPinyinCaseType.LOWERCASE
     * - HanyuPinyinToneType.WITH_TONE_NUMBER
     */
    public init()

    /**
     * 默认汉语拼音输出格式
     * - HanyuPinyinVCharType.WITH_U_AND_COLON
     * - HanyuPinyinCaseType.LOWERCASE
     * - HanyuPinyinToneType.WITH_TONE_NUMBER
     *
     * 返回值 Unit
     */
    public func restoreDefault(): Unit

    /**
     * 获取输出汉语拼音大小写格式
     *
     * 返回值 HanyuPinyinCaseType
     */
    public func getCaseType(): HanyuPinyinCaseType

    /**
     * 设置输出汉语拼音大小写格式
     *
     * 参数 caseType - HanyuPinyinCaseType
     * 返回值 Unit
     */
    public func setCaseType(caseType: HanyuPinyinCaseType): Unit

    /**
     * 获取输出汉语拼音声调格式
     *
     * 返回值 HanyuPinyinToneType
     */
    public func getToneType(): HanyuPinyinToneType

    /**
     * 设置输出汉语拼音声调格式
     *
     * 参数 toneType - HanyuPinyinToneType
     * 返回值 Unit
     */
    public func setToneType(toneType: HanyuPinyinToneType): Unit

    /**
     * 获取输出汉语拼音 u 的格式
     *
     * 返回值 HanyuPinyinVCharType
     */
    public func getVCharType(): HanyuPinyinVCharType

    /**
     * 获取输出汉语拼音 u 格式
     *
     * 参数 charType - HanyuPinyinVCharType
     * 返回值 Unit
     */
    public func setVCharType(charType: HanyuPinyinVCharType): Unit
}
```

### 2.5 Trie

汉语拼音节点树

```
public class Trie {

    /**
     * 获取本节点拼音
     *
     * 返回值 String
     */
    public func getPinyin(): String

    /**
     * 设置节点拼音
     *
     * 参数 pinyin - String
     * 返回值 Unit
     */
    public func setPinyin(pinyin: String): Unit

    /**
     * 获取下一个节点
     *
     * 返回值 ?Trie
     */
    public func getNextTire(): ?Trie

    /**
     * 设置下一个节点
     *
     * 参数 nextTire - Trie
     */
    public func setNextTire(nextTire: Trie): Unit

    /**
     * 加载拼音
     *
     * 参数 inStream - 拼音文件输入流，文件格式见源码目录 resource
     * 返回值 Unit
     */
    public func load(inStream: InputStream): Unit

    /**
     * 加载多音字拼音词典
     *
     * 参数 inStream - 拼音文件输入流，文件格式见源码目录 resource
     * 返回值 Unit
     */
    public func loadMultiPinyin(inStream: InputStream): Unit

    /**
     * 获取十六进制字符的节点树
     *
     * 参数 hexString - 十六进制字符串
     * 返回值 ?Trie
     */
    public func get(hexString: String): ?Trie

    /**
     * 往树种添加拼音字符串
     *
     * 参数 s - 拼音字符串
     * 参数 trie - Trie
     * 返回值 Unit
     */
    public func put(s: String, trie: Trie): Unit
}
```

### 2.6 BadHanyuPinyinOutputFormatCombination

拼音格式异常类

```
public class BadHanyuPinyinOutputFormatCombination <: Exception {
    /**
     * 初始化
     *
     * 参数 messages - 异常提示字符串
     */    
    public init(messages: String)
}
```