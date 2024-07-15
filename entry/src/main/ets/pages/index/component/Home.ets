import router from '@ohos.router'
import { CommonDialog } from '@app/common_lib'

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

      Text('长按：')
      Button('长按该按钮')
        .onClick(() => {
          console.log('发生了点击')
        })
        .gesture(
          LongPressGesture()
            .onAction((event: GestureEvent) => {
              console.log('发生了长按')
              let controller: CustomDialogController
              controller = new CustomDialogController({
                builder: myMenu({}),
                customStyle: true,
              })
              controller.open()
            })
        )
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
}

@CustomDialog
struct myMenu {
  dialogController: CustomDialogController
  declare appId: string
  deleteApp?: (id: string) => void

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon_menu_edit')).width(14).height(14).margin({ left: 14 })
        Text('编辑').margin({ left: 5 })
      }.height(37)
      .onClick(() => {
      })

      Row() {
        Image($r('app.media.icon_menu_delete')).width(14).height(14).margin({ left: 14 })
        Text('删除').margin({ left: 5 })
      }.height(37)
      .onClick(() => {
        this.dialogController.close()
        let dialogController: CustomDialogController
        dialogController = new CustomDialogController({
          builder: CommonDialog({
            content: '确定要删除该应用吗？',
            leftText: '我再想想',
            rightListener: () => {
              dialogController.close()
              if (this.deleteApp) {
                this.deleteApp(this.appId)
              }
            }
          }),
          customStyle: true,
        })
        dialogController.open()
      })
    }.backgroundColor('#fff').borderRadius(5).width(115).alignItems(HorizontalAlign.Start)
  }
}