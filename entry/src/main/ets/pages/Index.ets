import { ChineseHelper, PinyinFormat, PinyinHelper } from '@cangjie-tpc/pinyin'
import { hilog } from '@kit.PerformanceAnalysisKit'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Column(){
        Row(){
          Text("ChineseHelperArkts test")
        }
        .margin({ top: 10 })
        Row() {
          Button("convertToSimplifiedChinese")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new ChineseHelper()
              let pinyin = c.convertToSimplifiedChinese("臺，喪，麗")
              hilog.error(0, "", pinyin)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("convertToTraditionalChinese")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new ChineseHelper()
              let pinyin = c.convertToTraditionalChinese("台，丧，丽")
              hilog.error(0, "", pinyin)
            })
        }
        .margin({ top: 10 })
        Row() {
          Button("isTraditionalChinese")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new ChineseHelper()
              let pinyin = c.isTraditionalChinese("臺")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("isChinese")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new ChineseHelper()
              let pinyin = c.isChinese("a")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
        Row() {
          Button("containsChinese")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new ChineseHelper()
              let pinyin = c.containsChinese("adasf你好")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("addChineseDictResource")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let map: Map<string, string> = new Map([['癥', '症'], ['臺', '一']])
              let c = new ChineseHelper()
              c.addChineseDictResource(map)
              hilog.error(0, "", `${c.convertToSimplifiedChinese("癥")}---${c.convertToSimplifiedChinese("臺")}`)
            })
        }
        .margin({ top: 10 })
      }

      Column(){
        Row(){
          Text("PinyinHelperArkts test")
        }
        .margin({ top: 10 })
        Row() {
          Button("convertToPinyinArray")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin: Array<string> = c.convertToPinyinArray('长', PinyinFormat.WITH_TONE_MARK)
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
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
        Row() {
          Button("convertToPinyinStringTraditional")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin = c.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ", PinyinFormat.WITH_TONE_NUMBER)
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("convertToPinyinString")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin = c.convertToPinyinString("我是中国共产主义接班人。", " ")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
        Row() {
          Button("getShortPinyin")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin = c.getShortPinyin("我是中国共产主义接班人。")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("hasMultiPinyin")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin = c.hasMultiPinyin("长")
              hilog.error(0, "", `${pinyin}`)
            })
        }
        .margin({ top: 10 })

        Row() {
          Button("addPinyinDictResource")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let map: Map<string, string> = new Map([["安步当车","ān,bù,dàng,chē"]])
              let c = new PinyinHelper()
              c.addPinyinDictResource(map)
              hilog.error(0, "", `${c.convertToPinyinString("安步当车", ",")}`)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("addMutilPinyinDictResource")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let map: Map<string, string> = new Map([["噱曲蛙伢","āg,tù,dàny,rhē"]])
              let c = new PinyinHelper()
              c.addMutilPinyinDictResource(map)
              hilog.error(0, "", `${c.convertToPinyinString("噱曲蛙伢", ",")}`)
            })
        }
        .margin({ top: 10 })
        Row(){
          Button("toTongyongPinyinStringArray")
            .type(ButtonType.Capsule)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              let c = new PinyinHelper()
              let pinyin = c.toTongyongPinyinStringArray('傳')
              hilog.error(0, "", `${pinyin.toString()}`)
            })
        }
        .margin({ top: 10 })
      }
    }
    .height('100%')
    .width('100%')
  }
}