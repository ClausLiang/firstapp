import router from '@ohos.router'

@Preview
@Component
export struct Home {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Text(this.message)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Button('关于我们')
        .margin({ bottom: 10 })
        .onClick((event: ClickEvent) => {
          router.pushUrl({
            url: 'pages/about/about'
          }, router.RouterMode.Single)
        })

      Text('relativeContainer容器：')
      Row() {
        RelativeContainer() {
          Row() {
            Text('Tip')
          }
          .id('tip')
          .width(30)
          .height(20)
          .backgroundColor(Color.Red)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          })

          Row() {
            Text('你好我是一个文本，你好我是一个文本你好我是一个文本你好我是一个文本')
          }
          .id('text1')
          .width(500)
          .height(40)
          .alignRules({
            top: { anchor: 'tip', align: VerticalAlign.Top },
            left: { anchor: 'tip', align: HorizontalAlign.End }
          })
        }
      }
      .width('100%')
      .height(50)


      Text('颜色渐变：蓝白红')
      Row() {
      }.height(10).width('100%')
      .linearGradient({ angle: 90, repeating: false, colors: [[0x1677FF, 0], [0xFFFFFF, 0.5], [0xFF0000, 1]] })

      Text('颜色渐变：蓝白')
      Row() {
      }.height(10).width('100%')
      .linearGradient({ angle: 90, repeating: false, colors: [[0x1677FF, 0], [0xFFFFFF, 1]] })

      Text('Row容器，默认垂直居中：')
      Row() {
        Text('大文字').fontSize(40)
        Text('小文字').fontSize(12)
      }

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}