import {PinyinHelper,PinyinFormat} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct convertToPinyinStringTraditional {
  private pinyinHelper = new PinyinHelper()

  build() {
    Scroll(){
      Column() {
        Row(){
          Text("PinyinHelper.convertToPinyinStringTraditional").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
        }
        Column({space: 20}){
          Column(){
            Text("我是中國共產主義接班人。")
          }
          Column(){
            Text("separator: \" \" ")
          }
          Column(){
            Text("format:  PinyinFormat.WITH_TONE_MARK")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ", PinyinFormat.WITH_TONE_MARK)}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(150).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

        Column({space: 20}){
          Column(){
            Text("我是中國共產主義接班人。")
          }
          Column(){
            Text("separator: \" \" ")
          }
          Column(){
            Text("format:  PinyinFormat.WITHOUT_TONE")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ",PinyinFormat.WITHOUT_TONE)}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(150).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

        Column({space: 20}){
          Column(){
            Text("我是中國共產主義接班人。")
          }
          Column(){
            Text("separator: \" \" ")
          }
          Column(){
            Text("format:  PinyinFormat.WITH_TONE_NUMBER")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ",PinyinFormat.WITH_TONE_NUMBER)}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(170).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})


        Column({space: 20}){
          Column(){
            Text("我是中國共產主義接班人。")
          }
          Column(){
            Text("separator:  \" \"")
          }
          Column(){
            Text("format:  PinyinFormat.FIRST_LETTER")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", " ",PinyinFormat.FIRST_LETTER)}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(150).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})


        Column({space: 20}){
          Column(){
            Text("我是中國共產主義接班人。")
          }
          Column(){
            Text("separator: \"\"")
          }
          Column(){
            Text("format:  PinyinFormat.WITH_TONE_MARK")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinStringTraditional("我是中國共產主義接班人。", "",PinyinFormat.WITH_TONE_MARK)}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(150).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}