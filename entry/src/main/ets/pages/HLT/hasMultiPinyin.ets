import {PinyinHelper} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct hasMultiPinyin {
  private pinyinHelper = new PinyinHelper()

  build() {
    Column() {
      Row(){
        Text("PinyinHelper.hasMultiPinyin").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Column({space: 20}){
        Column(){
          Text("答")
        }
        Column(){
          Text(`${this.pinyinHelper.hasMultiPinyin('答')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("人")
        }
        Column(){
          Text(`${this.pinyinHelper.hasMultiPinyin('人')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}