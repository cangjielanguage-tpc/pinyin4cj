import {PinyinHelper} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct addPinyinDictResource {
  private pinyinHelper = new PinyinHelper()

  private chinese_dict: Map<string, string> = new Map([
    ['答', 'dā']
  ])

  private a:string = ""
  @State b:string = ""

  aboutToAppear() {
    this.a = this.pinyinHelper.convertToPinyinString('答理', "")
  }

  build() {
    Column() {
      Row(){
        Text("ChineseHelper.addChineseDictResource").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Column({space: 20}){
        Column(){
          Text("答理")
        }
        Column(){
          Text(`${this.a}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column() {
          Button("addChineseDictResource 之后").onClick(() => {
            this.pinyinHelper.addMutilPinyinDictResource(this.chinese_dict)
            this.b = this.pinyinHelper.convertToPinyinString('答理', " ")
          })
        }
        Column(){
          Text("答理")
        }
        Column(){
          Text(`${this.b}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(130).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}