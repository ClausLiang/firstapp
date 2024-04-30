@Entry
@Component
struct About {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Image($r('app.media.icon')).width('80')
        Text(this.message)
          .fontSize(50)
      }
      .width('100%')
    }
    .height('100%')
  }
}