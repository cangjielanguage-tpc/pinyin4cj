<div align="center">
<h1>pinyin4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.38.2-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-92.1%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

Pinyin4j 是一个支持将汉字转换成拼音的三方库，输出的拼音格式可以自定义设置。

### 特性

- 🚀 支持 Unicode 格式的字符 ü、支持声调符号、支持大小写

- 💪 支持转换通用拼音

- 🛠️ 支持转换通用拼音

- 🌍 支持常见多音字转换成拼音

- 💡 支持常用简体/繁体中文字符转换成拼音

## 软件架构

### 源码目录


```shell
.
├── doc
├── src
│   ├── bad_hanyu_pinyin_output_format_combination.cj
│   ├── chinese_to_pinyin_resource.cj
│   ├── get_file_path.cj
│   ├── hanyu_pinyi_vchar_type.cj
│   ├── hanyu_pinyin_case_type.cj
│   ├── hanyu_pinyin_output_format.cj
│   ├── hanyu_pinyin_tone_type.cj
│   ├── hashtable.cj
│   ├── pinyin_formatter.cj
│   ├── pinyin_helper.cj
│   ├── pinyin_romanization_type.cj
│   ├── resource_helper.cj
│   ├── trie.cj
└── test
│   ├── HLT
│   ├── LLT
│   └── UT
├── CHANGELOG.md
├── gitee_gate.cfg
├── LICENSE.txt
├── module.json
├── README.md
├── README.OpenSource
```

- `doc` 存放库的特性文档
- `src` 是库源码目录
- `test` 存放 HLT 测试用例、LLT 自测用例和 UT 单元测试用例

### 接口说明

主要类和函数接口说明详见 [API](./doc/feature_api.md)

## 使用说明

### 编译构建

1. linux x86_64 编译

```shell
./pinyin4cj_build.sh
```

2. Windows 编译
```shell
pinyin4cj_build.bat
```

### 功能示例

#### 词句转拼音示例

示例代码如下：

```cangjie
from pinyin4cj import pinyin4cj.*

main() {
    var defaultFormat: HanyuPinyinOutputFormat = HanyuPinyinOutputFormat()
    defaultFormat.setToneType(HanyuPinyinToneType.WITH_TONE_MARK)
    defaultFormat.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE)
    var pinyinArray: String = PinyinHelper.toHanYuPinyinString("我们是中国共产主义接班人", defaultFormat, ",", false)
    println(pinyinArray)
    return 0
}
```

执行结果如下：

```shell
wŏ,men,shì,zhōng,guó,gòng,chăn,zhŭ,yì,jiē,bān,rén
```

## 开源协议
xx License

## 参与贡献

欢迎给我们提交PR，欢迎给我们提交Issue，欢迎参与任何形式的贡献。