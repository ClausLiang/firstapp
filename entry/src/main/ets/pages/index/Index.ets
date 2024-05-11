import {Home} from './component/Home'
import {Mine} from './component/Mine'

@Entry
@Component
struct Index {
  build() {
    Tabs({barPosition: BarPosition.End}){
      TabContent(){
        Home()
      }.tabBar('首页')
      TabContent(){
        Mine()
      }.tabBar('我的')
    }
    .scrollable(false)
  }

}