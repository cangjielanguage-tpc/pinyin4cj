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

### 1.1 支持常用简体/繁体中文字符互转

可以将输入的繁体字符串(或简体字符串)转换成简体字符串(或繁体字符串)。

#### 1.1.1 主要接口

```cangjie
public class ChineseHelper {

    /**
     * 将包含繁体的字符串转换成简体字符串
     * 若有些繁体字转换不成预期的简体字，用户可自定义中文词典
     * 
     * 参数 str - 要转换的字符串
     * 返回值 String - 返回转换后的简体字符串
     *                若 str 为空字符串，返回结果为空字符串
     */
    public static func convertToSimplifiedChinese(str: String): String 

    /**
     * 将包含简体的字符串转换成繁体字符串
     * 若有些简体字转换不成预期的繁体字，用户可自定义中文词典
     *
     * 参数 str - 要转换的字符串
     * 返回值 String - 返回转换后的繁体字符串
     *                若 str 为空字符串，返回结果为空字符串
     */
    public static func convertToTraditionalChinese(str: String): String   
}
```

#### 1.1.2 示例

##### 繁体转简体

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = ChineseHelper.convertToSimplifiedChinese("臺，喪，麗")
    println(pinyin)
    return 0
}
```
执行结果如下：

```
台，丧，丽
```

##### 简体转繁体

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = ChineseHelper.convertToTraditionalChinese("我是中国人")
    println(pinyin)
    return 0
}
```
执行结果如下：

```
我是中國人
```

### 1.2 支持词、句转换成拼音

可以将包含多音字或繁体字的词或句转成拼音

#### 1.2.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 将包含多音字或繁体字的词或句转成拼音
     * 若有些字拼音没有达到预期效果，用户可自定义拼音词典
     * 
     * 参数 str - 要转换的字符串
     * 参数 separator - 分隔符
     * 返回值 String - 返回转换后的拼音字符串
     */
    public static func convertToPinyinString(str: String, separator: String): String
}
```

#### 1.2.2 示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ")
    println(pinyin)
    return 0
}
```
执行结果如下：

```
wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。
```

### 1.3 支持 Unicode 格式的字符ü、支持声调符号、支持拼音首字母的输出格式

可以将包含多音字或繁体字的词或句转成拼音，可以设置拼音输出格式

#### 1.3.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 将包含多音字或简体字的词或句转成拼音
     * 若有些字拼音没有达到预期效果，用户可自定义拼音词典
     * 
     * 参数 str - 要转换的字符串
     * 参数 separator - 分隔符
     * 参数 format - 输出拼音格式
     * 返回值 String - 返回转换后的拼音字符串
     */
    public static func convertToPinyinString(str: String, 
                                            separator: String, 
                                            format: PinyinFormat): String
    /**
     * 将包含多音字或繁体字的词或句转成拼音
     * 若有些字拼音没有达到预期效果，用户可自定义拼音词典
     * 
     * 参数 str - 要转换的字符串
     * 参数 separator - 分隔符
     * 参数 format - 输出拼音格式
     * 返回值 String - 返回转换后的拼音字符串
     */
    public static func convertToPinyinStringTraditional(str: String, 
                                                        separator: String, 
                                                        format: PinyinFormat): String
}
```

#### 1.3.2 包含简体中文字符转拼音示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = PinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
    println(pinyin)
    return 0
}
```
执行结果如下：

```
wo3 shi4 zhong1 guo2 gong4 chan3 zhu3 yi4 jie1 ban1 ren2 。
```

#### 1.3.3 包含繁体中文字符转拼音示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = PinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
    println(pinyin)
    return 0
}
```
执行结果如下：

```
wo3 shi4 zhong1 guo2 gong4 chan3 zhu3 yi4 jie1 ban1 ren2 。
```

### 1.4 支持添加自定义字典

若繁体字和简体字互转没有达到预期效果，用户可添加自定义中文字典

若词句转拼音结果没有达到预期效果，用户可添加自定义拼音字典和拼音组合字典

#### 1.4.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 用户添加自定义拼音字典
     * 
     * 参数 dict - 添加拼音字典
     * 返回值 Unit
     */
    public static func addPinyinDictResource(dict: HashMap<String, String>): Unit

    /**
     * 用户添加自定义拼音组合字典
     * 
     * 参数 dict - 添加拼音组合字典
     * 返回值 Unit
     */
    public static func addMutilPinyinDictResource(dict: HashMap<String, String>): Unit
}

public class ChineseHelper {

    /**
     * 用户添加自定义中文字典
     * 
     * 参数 dict - 添加中文字典
     * 返回值 Unit
     */
    public static func addChineseDictResource(dict: HashMap<String, String>): Unit
}

```

#### 1.4.2 示例

##### 自定义拼音字典

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    let map: HashMap<String, String> = HashMap<String, String>([("上", "shǎng")])
    PinyinHelper.addPinyinDictResource(map)
    var pinyin: String = PinyinHelper.convertToPinyinString("上午", " ", PinyinFormat.WITH_TONE_MARK)
    println(pinyin)
    return 0
}
```
执行结果如下：

```
shǎng wǔ
```
##### 自定义拼音组合字典

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    let map: HashMap<String, String> = HashMap<String, String>([("阿弥陀佛", "ā,mí,tuó,fó")])
    PinyinHelper.addMutilPinyinDictResource(map)
    var pinyin: String = PinyinHelper.convertToPinyinString("阿弥陀佛", " ", PinyinFormat.WITH_TONE_MARK)
    println(pinyin)
}
```
执行结果如下：

```
ā mí tuó fó
```

##### 自定义中文字典

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    let map: HashMap<Char, Char> = HashMap<Char, Char>([('癥', '症')])
    ChineseHelper.addChineseDictResource(map)
    var pinyin: String = ChineseHelper.convertToSimplifiedChinese("癥")
    println(pinyin)
    return 0
}
```
执行结果如下：

```
症
```

### 1.5 支持常见多音字转换成拼音

将多音字的转换成拼音集合，集合中包含所有读音

#### 1.5.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 常用多音字的转换成拼音集合
     * 
     * 参数 c - 字符
     * 参数 format - 输出格式
     * 返回值 Array<String>
     */
    public static func convertToPinyinArray(c: Char, format: PinyinFormat): Array<String>
}
```

#### 1.5.2 示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = PinyinHelper.convertToPinyinArray('长', PinyinFormat.WITH_TONE_MARK)
    println(pinyin)
    return 0
}
```
执行结果如下：

```
["cháng", "zhǎng"]
```


### 1.6 支持常用简体/繁体中文字符转换成拼音

获取单个汉字（简体和繁体）的所有指定格式的汉语拼音

#### 1.6.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 常用简体或繁体转换成拼音集合
     * 
     * 参数 c - 字符
     * 参数 format - 输出格式
     * 返回值 Array<String>
     */
    public static func convertToPinyinArray(c: Char, format: PinyinFormat): Array<String>
}
```

#### 1.6.2 示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var pinyin: String = PinyinHelper.convertToPinyinArray('嚴', PinyinFormat.WITH_TONE_MARK)
    println(pinyin)
    return 0
}
```
执行结果如下：

```
["yán"]
```

### 1.7 支持常用简体/繁体中文字符转换成通用拼音

获取单个汉字（简体和繁体）的数字音标的通用拼音

#### 1.7.1 主要接口

```cangjie
public class PinyinHelper {

    /**
     * 获取单个汉字（简体和繁体）的数字音标的通用拼音
     * 
     * 参数 char - 字符
     * 返回值 Array<String> 
     *        - 是汉字返回通用拼音
     *        - 不是汉字返回 []
     */
    public static func toTongyongPinyinStringArray(char: Char): Array<String>
}
```

#### 1.7.2 示例

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var simplePinyin: String = PinyinHelper.toTongyongPinyinStringArray('傳')
    var traditionalPinyin: String = PinyinHelper.toTongyongPinyinStringArray('传')
    println(simplePinyin)
    println(traditionalPinyin)
    return 0
}
```
执行结果如下：

```
["chuan2", "jhuan4"]
["chuan2", "jhuan4"]
```

## 2 其他接口

### 2.1 ChineseHelper

中文转换器

```cangjie
public class ChineseHelper {

    /**
     * 判断字符是否是繁体字
     *
     * 参数 c - 字符
     * 返回值 Bool
     */
    public static func isTraditionalChinese(c: Char): Bool 

    /**
     * 判断字符是否是汉字
     *
     * 参数 c - 字符
     * 返回值 Bool
     */
    public static func isChinese(c: Char): Bool

    /**
     * 判断字符串是否包含汉字
     *
     * 参数 str - 字符串
     * 返回值 Bool
     */
    public static func containsChinese(str: String): Bool
}
```

### 2.2 PinyinFormat

定义输出汉语拼音格式

| 格式 | 结果 | 
| --------- | -----|
|  WITH_TONE_MARK   | lǚ   |
|  WITHOUT_TONE     | lü   |
|  WITH_TONE_NUMBER | lü3  |
|  FIRST_LETTER     | l    |


```cangjie

public enum PinyinFormat {
    | WITH_TONE_MARK
    | WITHOUT_TONE
    | WITH_TONE_NUMBER
    | FIRST_LETTER

    /*
     * 获取格式名称
     *
     * 返回值 String
     */
    public func getName(): String
}
```

### 2.3 PinyinHelper

拼音转换器

```
public class PinyinHelper {

    /**
     * 获取词句首字母格式的拼音
     *
     * 参数 str - 字符串
     * 返回值 String
     */
    public static func getShortPinyin(str: String): String

    /**
     * 判断字符是否为多音字
     *
     * 参数 c - 字符
     * 返回值 Bool
     */
    public static func hasMultiPinyin(c: Char): Bool

}
```

