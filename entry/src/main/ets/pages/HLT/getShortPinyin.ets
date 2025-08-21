import {PinyinHelper} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct getShortPinyin {
  private pinyinHelper = new PinyinHelper()

  build() {
    Column() {
      Row(){
        Text("PinyinHelper.getShortPinyin").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Column({space: 20}){
        Column(){
          Text("爱我中华")
        }
        Column(){
          Text(`${this.pinyinHelper.getShortPinyin('爱我中华')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("爱我中國")
        }
        Column(){
          Text(`${this.pinyinHelper.getShortPinyin('爱我中國')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。")
        }
        Column(){
          Text(`${this.pinyinHelper.getShortPinyin('wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。爱我")
        }
        Column(){
          Text(`${this.pinyinHelper.getShortPinyin('wǒ shì zhōng guó gòng chǎn zhǔ yì jiē bān rén 。爱我')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(120).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Text("")
        }
        Column(){
          Text(`${this.pinyinHelper.getShortPinyin('')}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(120).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}