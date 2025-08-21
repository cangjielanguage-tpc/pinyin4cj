import {ChineseHelper,PinyinFormat} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct convertToSimplifiedChinese_01 {
  private chineseHelper = new ChineseHelper()

  build() {
    Column() {
      Row(){
        Text("ChineseHelper.convertToSimplifiedChinese").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Row({space: 20}){
        Row(){
          Text("國會")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToSimplifiedChinese('國會')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToSimplifiedChinese('')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("中国")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToSimplifiedChinese('中国')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("中國123")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToSimplifiedChinese('中國123')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("中國 666")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToSimplifiedChinese('中國 666')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}