<div align="center">
<h1>pinyin4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v1.0.5-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v1.0.0-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-99.0%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

pinyin4cj 是一个支持将汉字转换成拼音的三方库，输出的拼音格式可以自定义设置。

### 特性

- 🚀 支持词、句转换成拼音

- 💪 支持常用简体/繁体中文字符转换成拼音

- 🛠️ 支持常见多音字符转换成拼音

- 🌍 支持Unicode格式的字符ü、支持声调符号、支持首字母格式

- 💪 支持常用简体、繁体中文字符互转

- 🚀 支持添加自定义字典

- 🛠️ 支持常用简体/繁体中文字符转换成通用拼音

## 软件架构

### 源码目录

```shell
├─ AppScope
├─ doc                      # API文档        
├─ entry                    # 示例代码文件夹                  
├─ pinyin                   # pinyin 库源目录                  
│  └─ src
│      └─ main
│          ├─ cangjie       # cangjie 源码
│          ├─ ets           # ets 源码                       
│          └─ resources     # 资源文件
├─ hvigor                   # 构建工具目录
└─ README.md                # pinyin 介绍及使用说明
```

- `pinyin` 工程模块 - 编译生成一个har包
- `pinyin src` 模块代码目录
- `pinyin src main` 模块项目目录
- `pinyin src main cangjie` 仓颉代码目录
- `pinyin src main ets` ets代码目录
- `pinyin src main resources` 资源文件目录
-
### 接口说明

主要类和函数接口说明详见 [API](https://gitcode.com/Cangjie-TPC/pinyin4cj/blob/pinyin4cj_hybrid_cangjie-plugin-5.1.0.828/doc/feature_api.md)

## 使用说明

### 编译构建

1. 下载安装
   通过中心仓下载安装

      ```sh
      ohpm install @cangjie-tpc/pinyin
      ```

2. 在项目中使用 pinyin 项目

   ```arkts
   import { ChineseHelper, PinyinFormat, PinyinHelper } from '@cangjie-tpc/pinyin'
   ```

### 功能示例

```ets
import { ChineseHelper, PinyinFormat, PinyinHelper } from '@cangjie-tpc/pinyin'
import { hilog } from '@kit.PerformanceAnalysisKit';

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
              hilog.error(0X000000, "pinyin", `${pinyin}`)
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

## 约束与限制

- DevEco Studio  5.1.0.828SP1
- Cangjie Plugin Canary  5.1.0.828

## 开源协议

本项目基于 [MIT License](./LICENSE)，请自由的享受和参与开源。

## 参与贡献

欢迎给我们提交 PR，欢迎给我们提交 Issue，欢迎参与任何形式的贡献。