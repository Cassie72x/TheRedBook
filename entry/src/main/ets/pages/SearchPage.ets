import router from '@ohos.router';

// 新增：定义数据类型
interface SearchItem {
  text: string;
  isHot: boolean;
}

// 搜索内容组件（滚动内容区：历史记录 + 猜你想搜 + 双列布局）
@Component
struct SearchContent {
  build() {
    Scroll() {
      Column() {
        // --- 历史记录 ---
        Row() {
          Text("历史记录")
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333')

          Blank()

          Image($r('app.media.sign_rubbish')) // 垃圾桶图标
            .width(20)
            .height(20)
            .fillColor('#999')
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 0, bottom: 12 })

        // 历史标签 (还原截图：白底灰边胶囊样式)
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(["桂林游玩攻略", "桂林", "五一去哪旅游合适", "旅游攻略", "性格测试"], (item: string) => {
            Text(item)
              .fontSize(14)
              .fontColor('#333')
              .padding({ left: 16, right: 16, top: 8, bottom: 8 })
              .border({ width: 1, color: '#E8E8E8', radius: 20 })
              .backgroundColor('#FFF')
              .margin({ right: 12, bottom: 12 })
          })

          // 展开箭头
          Row() {
            Image($r('app.media.sign_drop_down'))
              .width(20)
              .height(20)
          }
          .width(36)
          .height(36)
          .border({ width: 1, color: '#E8E8E8', radius: 18 })
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .margin({ bottom: 12 })
        }
        .padding({ left: 16, right: 16 })

        // --- 猜你想搜 ---
        Row() {
          Text("猜你想搜")
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333')

          Blank()

          Image($r('app.media.sign_drop_down'))
            .width(20)
            .height(20)
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 16, bottom: 12 })

        // 双列布局 (还原截图：每行两个，高度一致)
        Grid() {
          ForEach([
            { text: "氛围感的背景图", isHot: false },
            { text: "抒情的森林再发文", isHot: true },
            { text: "五月份去哪里旅游合适", isHot: false },
            { text: "广西先去桂林还是阳朔", isHot: false },
            { text: "入门级hiphop舞蹈", isHot: false },
            { text: "《new dance》完整版", isHot: false }
          ], (item: SearchItem) => {
            GridItem() {
              Row() {
                Text(item.text)
                  .fontSize(15)
                  .fontColor('#333')
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .layoutWeight(1)

                if (item.isHot) {
                  Text("热")
                    .fontSize(10)
                    .fontColor('#FFF')
                    .backgroundColor('#FF2442')
                    .padding({ left: 3, right: 3, top: 1, bottom: 1 })
                    .borderRadius(3)
                    .margin({ left: 6 })
                }
              }
              .width('100%')
              .height(40) // 固定高度确保对齐
              .alignItems(VerticalAlign.Center)
            }
          })
        }
        .columnsTemplate('1fr 1fr') // 两列等宽
        .rowsGap(8)
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 800 }) // 底部留白给悬浮按钮
      }
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.None)
  }
}

@Entry
@Component
struct SearchPage {
  @State inputText: string = "";

  build() {
    Stack() {
      Column() {
        // 1. 顶部搜索栏 (还原截图：圆角容器包裹输入框、相机和搜索按钮)
        Row() {
          Text("←")
            .fontSize(24)
            .fontColor('#333')
            .margin({ right: 12 })
            .onClick(() => router.back())

          // 搜索组合框
          Row() {
            TextInput({ placeholder: "氛围感的背景图", text: this.inputText })
              .onChange(val => this.inputText = val)
              .layoutWeight(1)
              .backgroundColor(Color.Transparent)
              .fontSize(14)
              .placeholderColor('#999')
              .height('100%')

            Image($r('app.media.search_camera'))
              .width(22)
              .height(22)
              .margin({ right: 10 })

            Text("搜索")
              .fontSize(15)
              .fontColor('#333')
              .fontWeight(FontWeight.Medium)
          }
          .layoutWeight(1)
          .height(36)
          .backgroundColor("#F5F5F5") // 浅灰背景
          .borderRadius(18)
          .padding({ left: 12, right: 12 })
          .alignItems(VerticalAlign.Center)
        }
        .width('100%')
        .height(56)
        .padding({ left: 12, right: 12 })
        .alignItems(VerticalAlign.Center)

        // 2. 滚动内容区（已打包到组件中）
        SearchContent()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFF')
      .justifyContent(FlexAlign.Start)

      // 3. 底部悬浮麦克风 (还原截图：渐变背景 + 悬浮按钮)
      Row() {
        Column() {
          Text("按住提问 有问必答 ✨")
            .fontSize(13)
            .fontColor('#666')
            .margin({ bottom: 16 })

          Row() {
            Image($r('app.media.sign_mike'))
              .width(20)
              .height(45)
          }
          .width(96)
          .height(48)
          .borderRadius(24)
          .backgroundColor('#FFF')
          .shadow({ radius: 15, color: '#1A000000', offsetY: 4 })
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
        }
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .height(160)
      .padding({ bottom: 50 })
      .justifyContent(FlexAlign.Center)
      .linearGradient({
        direction: GradientDirection.Top,
        colors: [['#FFF', 0.0], ['rgba(255,255,255,0)', 1.0]]
      })
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.Bottom)
  }
}
