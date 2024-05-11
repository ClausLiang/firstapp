@Component
export struct Mine {
  @State message: string = 'Hello World'
  build(){
    Column(){
      Text('我的页面')
    }
  }
}