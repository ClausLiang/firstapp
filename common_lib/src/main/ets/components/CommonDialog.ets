import display from '@ohos.display';
/**
 * todo controller 为undefined
 * 默认包含取消、确定按钮
 */
@Preview
@CustomDialog
export struct CommonDialog {
  controller?: CustomDialogController
  title: string = ''
  content: ResourceStr = ''
  leftText: string = ''
  rightText: string = '确定'
  leftListener?: () => void
  rightListener?: () => void

  //获取屏幕的宽度
  private screenWidth: number = px2vp(display.getDefaultDisplaySync().width)

  aboutToAppear() {
  }

  build() {
    Column() {
      if (this.title) {
        Text(this.title)
          .fontColor('#333333')
          .width('100%')
          .fontSize(17)
          .margin({ bottom: 10 })
          .textAlign(TextAlign.Center)
      }

      Text(this.content)
        .fontColor('#333333')
        .width('100%')
        .fontSize(14)
        .margin({ top: 10, bottom: 10 })
        .textAlign(TextAlign.Center)

      Row() {
        if (this.leftText) {
          Button(this.leftText, { type: ButtonType.Capsule })
            .height(38)
            .layoutWeight(1)
            .margin({ right: 5 })
            .fontSize(12)
            .fontColor('#1677FF')
            .backgroundColor(Color.White)
            .border({
              color: '#ff1677ff',
              width: 1
            })
            .onClick(() => {
              if (this.leftListener == null) {
                this.controller?.close();
              } else {
                this.leftListener()
              }
            })
        }

        Button(this.rightText)
          .height(38)
          .layoutWeight(1)
          .margin({ left: 5 })
          .fontSize(12)
          .fontColor(Color.White)
          .onClick(() => {
            this.controller?.close();
            if (this.rightListener != null) {
              this.rightListener()
            }
          })
      }.width('100%').margin({ top: 20 }).justifyContent(FlexAlign.SpaceAround)

    }.width(this.screenWidth - 80)
    .borderRadius(10)
    .padding({ left: 10, right: 10, top: 14, bottom: 14 })
    .backgroundColor(Color.White)
  }
}
