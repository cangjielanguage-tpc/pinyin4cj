import {ChineseHelper} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct isTraditionalChinese {
  private chineseHelper = new ChineseHelper()

  build() {
    Column() {
      Row(){
        Text("ChineseHelper.isTraditionalChinese").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Column({space: 20}){
        Column(){
          Text("國")
        }
        Column(){
          Text(`${this.chineseHelper.isTraditionalChinese('國')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("国")
        }
        Column(){
          Text(`${this.chineseHelper.isTraditionalChinese('国')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}