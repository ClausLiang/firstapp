import { Home } from './Home'
import { Mine } from './Mine'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  tabsController: TabsController = new TabsController()

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Home()
      }.tabBar(this.TabBuilder(0, $r('app.media.icon_home_checked'), $r('app.media.icon_home'), '首页'))

      TabContent() {
        Mine()
      }.tabBar(this.TabBuilder(1, $r('app.media.icon_mine_checked'), $r('app.media.icon_mine'), '我的'))
    }
    .scrollable(false)
    .onChange((index) => {
      // 当scrollable是true时，左右滑动不联动底下的tab，需要手动赋值
      this.currentIndex = index
    })
  }

  @Builder
  TabBuilder(targetIndex: number, selectedImage: Resource, normalImage: Resource, title: string) {
    Column() {
      Image(this.currentIndex == targetIndex ? selectedImage : normalImage).size({ width: 19, height: 19 })
        .objectFit(ImageFit.Contain)
      Text(title).margin({ top: 3 }).fontSize(10).fontColor(this.currentIndex == targetIndex ? '#1698CE' : '#6B6B6B')
    }.width('100%')
    .height(46)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      // 点击手动切换tabContent
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
    })
  }
}