import router from '@ohos.router'

@Component
export struct Home{
  @State message: string = 'Hello World'

  build(){
    Column() {
      Text(this.message)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Button('关于我们').onClick((event: ClickEvent) => {
        router.pushUrl({
          url: 'pages/about/about'
        }, router.RouterMode.Single)
      })
      // Row(){
      //   Text('tip').backgroundColor(Color.Red)
      //   Text('你好我是一个文本，你好我是一个文本你好我是一个文本你好我是一个文本')
      // }
      Row() {
        // Text('      你好我是一个文本，你好我是一个文本你好我是一个文本你好我是一个文本')
        RelativeContainer() {
          Row() {
            Text('Tip')
          }
          .width(30)
          .height(20)
          .backgroundColor(Color.Red)
          .alignRules({
            top: { anchor: 'cont1', align: VerticalAlign.Top },
            left: { anchor: 'cont1', align: HorizontalAlign.Start }
          })
          .id('tip')

          Row() {
            Text('你好我是一个文本，你好我是一个文本你好我是一个文本你好我是一个文本')
          }
          .width(500)
          .height(40)
          .alignRules({
            top: { anchor: 'tip', align: VerticalAlign.Top },
            left: { anchor: 'tip', align: HorizontalAlign.End }
          })
          .id('text1')
        }.id('cont1')
      }.width('100%')

      // RelativeContainer() {
      //   Row()
      //     .width(100)
      //     .height(100)
      //     .backgroundColor(Color.Red)
      //     .alignRules({
      //       top: { anchor: '__container__', align: VerticalAlign.Top },
      //       left: { anchor: '__container__', align: HorizontalAlign.Start }
      //     })
      //     .id("row1")
      //
      //   Row()
      //     .width(100)
      //     .height(100)
      //     .backgroundColor(Color.Green)
      //     .alignRules({
      //       top: { anchor: '__container__', align: VerticalAlign.Top },
      //       right: { anchor: '__container__', align: HorizontalAlign.End }
      //     })
      //     .id("row2")
      // }.width('100%')

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}