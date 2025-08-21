import {PinyinHelper,PinyinFormat} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct convertToPinyinString_01 {
  private pinyinHelper = new PinyinHelper()

  build() {
    Scroll(){
      Column() {
        Row(){
          Text("PinyinHelper.convertToPinyinString").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
        }
        Column({space: 20}){
          Column(){
            Text("我是中国共产主义接班人。")
          }
          Column(){
            Text("separator: \"\" ")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "")}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(120).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

        Column({space: 20}){
          Column(){
            Text("我是中国共产主义接班人。")
          }
          Column(){
            Text("separator: \" \" ")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ")}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(120).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

        Column({space: 20}){
          Column(){
            Text("我是中国共产主义接班人。")
          }
          Column(){
            Text("separator: 123 ")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "123")}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(130).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})


        Column({space: 20}){
          Column(){
            Text("我是中国共产主义接班人。")
          }
          Column(){
            Text("separator: a ")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinString("我是中国共产主义接班人。", "a")}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(130).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})


        Column({space: 20}){
          Column(){
            Text("我是中国共产主义接班人。")
          }
          Column(){
            Text("separator: \" \"")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinString("我是中国共产主义接班人。", " ")}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(120).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

        Column({space: 20}){
          Column(){
            Text("答应")
          }
          Column(){
            Text("separator: \" \"")
          }
          Column(){
            Text(`${this.pinyinHelper.convertToPinyinString("答应", " ")}`)
          }
        }.alignItems(HorizontalAlign.Start).width('100%').height(120).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}