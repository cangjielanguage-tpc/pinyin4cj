import {ChineseHelper} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct containsChinese {
  private chineseHelper = new ChineseHelper()

  build() {
    Column() {
      Row(){
        Text("ChineseHelper.containsChinese").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Column({space: 20}){
        Column(){
          Text("adasf你好")
        }
        Column(){
          Text(`${this.chineseHelper.containsChinese('adasf你好')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("adas")
        }
        Column(){
          Text(`${this.chineseHelper.containsChinese('adas')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text(" ")
        }
        Column(){
          Text(`${this.chineseHelper.containsChinese(' ')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}