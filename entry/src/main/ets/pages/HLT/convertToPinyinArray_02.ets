import {PinyinHelper,PinyinFormat} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct convertToPinyinArray_02 {
  private pinyinHelper = new PinyinHelper()

  build() {
    Column() {
      Row(){
        Text("PinyinHelper.convertToPinyinArray").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Row({space: 20}){
        Row(){
          Text("稱")
        }.width('4%')
        Row(){
          Text(PinyinFormat.WITH_TONE_MARK)
        }.width('43%')
        Row(){
          Text(`${this.pinyinHelper.convertToPinyinArray('稱', PinyinFormat.WITH_TONE_MARK)}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("國")
        }.width('4%')
        Row(){
          Text(PinyinFormat.WITH_TONE_MARK)
        }.width('43%')
        Row(){
          Text(`${this.pinyinHelper.convertToPinyinArray('國', PinyinFormat.WITH_TONE_MARK)}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("稱")
        }.width('4%')
        Row(){
          Text(PinyinFormat.WITHOUT_TONE)
        }.width('43%')
        Row(){
          Text(`${this.pinyinHelper.convertToPinyinArray('稱', PinyinFormat.WITHOUT_TONE)}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("稱")
        }.width('4%')
        Row(){
          Text(PinyinFormat.WITH_TONE_NUMBER)
        }.width('43%')
        Row(){
          Text(`${this.pinyinHelper.convertToPinyinArray('稱', PinyinFormat.WITH_TONE_NUMBER)}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

      Row({space: 20}){
        Row(){
          Text("稱")
        }.width('4%')
        Row(){
          Text(PinyinFormat.FIRST_LETTER)
        }.width('43%')
        Row(){
          Text(`${this.pinyinHelper.convertToPinyinArray('稱', PinyinFormat.FIRST_LETTER)}`)
        }
      }.justifyContent(FlexAlign.Start).width('100%').height(67).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:5})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}