import router from '@ohos.router'

@Entry
@Component
struct Index {
  private arr: string[] = [
    "pages/HLT/convertToPinyinArray_01",
    "pages/HLT/convertToPinyinArray_02",
    "pages/HLT/convertToPinyinString_01",
    "pages/HLT/convertToPinyinStringFormat",
    "pages/HLT/convertToPinyinStringTraditional",
    "pages/HLT/toTongyongPinyinStringArray",
    "pages/HLT/convertToSimplifiedChinese_01",
    "pages/HLT/convertToTraditionalChinese_01",
    "pages/HLT/getShortPinyin",
    "pages/HLT/hasMultiPinyin",
    "pages/HLT/isChinese",
    "pages/HLT/containsChinese",
    "pages/HLT/isTraditionalChinese",
    "pages/HLT/addChineseDictResource",
    "pages/HLT/addMutilPinyinDictResource",
    "pages/HLT/addPinyinDictResource"
  ]

  build() {
    Column() {
      Text("pinyin4cj ArKTS test ").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 5})
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%').height(45).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.onClick(() => {
            router.push({ url: item })
          })
        }, (item: string) => item)
      }
      .listDirection(Axis.Vertical) // Arrangement direction
      .scrollBar(BarState.Off)
      .friction(0.6)
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // Divider
      .edgeEffect(EdgeEffect.Spring) // Set the edge scrolling effect to Spring.
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 10, bottom:70 })
  }
}