// Index.ets
@Entry
@Component
struct Index {
  @State message: string = '连接城市间最小生成树';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
        // 添加按钮，以响应用户onClick事件
        Button() {
          Text('Prim算法')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#ff69e6ff')
        .width('50%')
        .height('5%')
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 获取UIContext
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();
          // 跳转到第二页
          router.pushUrl({ url: 'pages/PrimPage' }).then(() => {
            console.info('Succeeded in jumping to the PrimPage.')

          }).catch((err: BusinessError) => {
            console.error(`Failed to jump to the PrimPage. Code is ${err.code}, message is ${err.message}`)
          })
        })

        Button() {
          Text('Kruskal算法')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#ff69e6ff')
        .width('50%')
        .height('5%')
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 获取UIContext
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();
          // 跳转到第三页
          router.pushUrl({ url: 'pages/KruskalPage' }).then(() => {
            console.info('Succeeded in jumping to the KruskalPage.')

          }).catch((err: BusinessError) => {
            console.error(`Failed to jump to the KruskalPage. Code is ${err.code}, message is ${err.message}`)
          })
        })
      }

      .width('100%')
    }
    .height('100%')
  }
}