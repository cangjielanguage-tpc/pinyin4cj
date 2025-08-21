import {ChineseHelper,PinyinFormat} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct convertToTraditionalChinese_01 {
  private chineseHelper = new ChineseHelper()

  build() {
    Column() {
      Row(){
        Text("ChineseHelper.convertToTraditionalChinese").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Row({space: 20}){
        Row(){
          Text("国会")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToTraditionalChinese('国会')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToTraditionalChinese('')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("中國")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToTraditionalChinese('中國')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("中国123")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToTraditionalChinese('中国123')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("中国 666")
        }.width('20%')
        Row(){
          Text(`${this.chineseHelper.convertToTraditionalChinese('中国 666')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(40).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}