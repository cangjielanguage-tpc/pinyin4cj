import {PinyinHelper,PinyinFormat} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct toTongyongPinyinStringArray {
  private pinyinHelper = new PinyinHelper()

  build() {
    Column() {
      Row(){
        Text("PinyinHelper.toTongyongPinyinStringArray").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Row({space: 20}){
        Row(){
          Text("傳")
        }.width('4%')
        Row(){
          Text(`${this.pinyinHelper.toTongyongPinyinStringArray('傳')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("曲")
        }.width('4%')
        Row(){
          Text(`${this.pinyinHelper.toTongyongPinyinStringArray('曲')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("缺")
        }.width('4%')
        Row(){
          Text(`${this.pinyinHelper.toTongyongPinyinStringArray('缺')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("选")
        }.width('4%')
        Row(){
          Text(`${this.pinyinHelper.toTongyongPinyinStringArray('选')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("项")
        }.width('4%')
        Row(){
          Text(`${this.pinyinHelper.toTongyongPinyinStringArray('项')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text(" ")
        }.width('4%')
        Row(){
          Text(`${this.pinyinHelper.toTongyongPinyinStringArray(' ')}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}