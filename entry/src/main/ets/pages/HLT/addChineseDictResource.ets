import {ChineseHelper} from "@cangjie-tpc/pinyin"

@Entry
@Component
struct addChineseDictResource {
  private chineseHelper = new ChineseHelper()

  private chinese_dict: Map<string, string> = new Map([
    ['鬍', '胡'],
    ['迴', '回'],
    ['匯', '汇'],
    ['穫', '获'],
    ['颳', '刮'],
    ['髮', '发'],
    ['繋', '系'],
    ['噁', '恶'],
    ['噹', '当'],
    ['鼕', '冬'],
    ['闘', '门'],
    ['纔', '才'],
    ['乗', '乘'],
    ['齣', '出'],
    ['闇', '暗']
  ])

  private a:string = ""
  @State b:string = ""

  aboutToAppear() {
    this.a = this.chineseHelper.convertToSimplifiedChinese('鬍')
  }

  build() {
    Column() {
      Row(){
        Text("ChineseHelper.addChineseDictResource").height(50).width("100%").backgroundColor("#483d8b").textAlign(TextAlign.Center).fontColor("#ffffff").margin({bottom: 15})
      }
      Column({space: 20}){
        Column(){
          Text("鬍")
        }
        Column(){
          Text(`${this.a}`)
        }
      }.alignItems(HorizontalAlign.Start).width('100%').height(90).backgroundColor("#ffffff").margin({bottom: 10}).padding({left:10, top: 10, bottom:10})

      Column({space: 20}){
        Column(){
          Button("addChineseDictResource 之后").onClick(() => {
            this.chineseHelper.addChineseDictResource(this.chinese_dict)
            this.b = this.chineseHelper.convertToSimplifiedChinese('鬍')
          })
        }
        Column(){
          Text("鬍")
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