import router from '@ohos.router';

// 更精确还原小红书个人主页布局 - 1:1 复刻图片样式
@Entry
@Component
struct ProfilePage {
  @State bottomNavIndex: number = 4;        // 当前选中底部导航（我）
  @State profileTabIndex: number = 0;       // 当前选中资料Tab（笔记/评论/收藏/赞过）
  @State isShowPublishSheet: boolean = false;
  private profileTabs: string[] = ['笔记', '评论', '收藏', '赞过'];

  // 统计数据
  @State followingCount: number = 148;
  @State followersCount: number = 11;
  @State likesCount: number = 100;
  @State publicNotes: number = 0;
  @State privateNotes: number = 2;
  @State collections: number = 0;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      // 可滚动主内容区
      Scroll() {
        Column() {
          // ---------- 顶部背景区域（渐变+个人信息）----------
          Column() {
            // 顶部渐变背景层（包含所有头部信息，实现小红书特有的沉浸背景）
            Column() {
              // 状态栏占位（模拟沉浸效果）
              Row().height(40).width('100%')

              // 顶部导航栏（汉堡菜单 + 右侧操作区）
              Row() {
                Row() {
                  Text("☰")
                    .fontSize(24)
                    .fontColor('#FFF')
                    .fontWeight(FontWeight.Normal)
                }
                .width(44)
                .height(44)
                .justifyContent(FlexAlign.Center)

                Blank()

                Row({ space: 12 }) {
                  // 设置背景按钮（左侧图片在灰色框内）
                  Row({ space: 4 }) {
                    Image($r('app.media.ProfilePage_m'))
                      .width(13)
                      .height(13)
                    Text("设置背景")
                      .fontSize(13)
                      .fontColor('#FFF')
                  }
                  .padding({ left: 12, right: 12, top: 6, bottom: 8 })
                  .backgroundColor('rgba(255, 255, 255, 0.2)')
                  .borderRadius(20)

                  // 右侧第一个图片 ProfilePage_b（在灰色框外）
                  Image($r('app.media.ProfilePage_b'))
                    .width(22)
                    .height(22)

                  // 右侧第二个图片 ProfilePage_a（在灰色框外）
                  Image($r('app.media.ProfilePage_a'))
                    .width(22)
                    .height(22)
                }
                .padding({ right: 16 })
              }
              .width('100%')
              .height(50)

              // 用户信息卡片
              Row() {
                // 头像区域 + 添加故事按钮
                Stack({ alignContent: Alignment.BottomEnd }) {
                  // 头像
                  Image($r('app.media.ProfilePage_avatar'))
                    .width(80)
                    .height(80)
                    .borderRadius(40)
                    .border({ width: 2, color: Color.White })

                  // 添加故事按钮（金色+号）
                  Row() {
                    Text("+")
                      .fontSize(20)
                      .fontColor('#333')
                      .fontWeight(FontWeight.Bold)
                  }
                  .width(28)
                  .height(28)
                  .backgroundColor('#ffe100')
                  .borderRadius(14)
                  .border({ width: 2, color: '#FFF' })
                  .justifyContent(FlexAlign.Center)
                }

                Column({ space: 4 }) {
                  // 用户名 + 向下箭头
                  Row({ space: 4 }) {
                    Text("momo")
                      .fontSize(22)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Bold)
                    Text("▼")
                      .fontSize(12)
                      .fontColor('#FFF')
                      .margin({ top: 2 })
                  }
                  .alignItems(VerticalAlign.Center)

                  // 小红书号 + 复制图标
                  Row({ space: 6 }) {
                    Text("小红书号：20732088666")
                      .fontSize(12)
                      .fontColor('rgba(255, 255, 255, 0.85)')
                    Image($r('app.media.ProfilePage_h'))
                      .width(14)
                      .height(14)
                  }

                  // IP属地
                  Row({ space: 4 }) {
                    Text("IP属地：广东")
                      .fontSize(12)
                      .fontColor('rgba(255, 255, 255, 0.85)')
                    Text("ⓘ")
                      .fontSize(11)
                      .fontColor('rgba(255, 255, 255, 0.6)')
                  }
                }
                .alignItems(HorizontalAlign.Start)
                .margin({ left: 16 })
                .layoutWeight(1)
              }
              .width('100%')
              .padding({ left: 20, right: 20, top: 8 })

              // 简介编辑区
              Text("点击这里，填写简介")
                .fontSize(14)
                .fontColor('rgba(255, 255, 255, 0.9)')
                .width('100%')
                .padding({ left: 20, top: 16, bottom: 8 })

              // 数据统计行（关注/粉丝/获赞+编辑资料+设置）
              Row() {
                // 左侧统计项（Row包裹）
                Row({ space: 13 }) {
                  // 关注
                  Column() {
                    Text(this.followingCount.toString())
                      .fontSize(13)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Medium)
                    Text("关注")
                      .fontSize(12)
                      .fontColor('rgba(255, 255, 255, 0.7)')
                      .margin({ top: 2 })
                  }
                  .alignItems(HorizontalAlign.Center)

                  // 粉丝
                  Column() {
                    Text(this.followersCount.toString())
                      .fontSize(13)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Medium)
                    Text("粉丝")
                      .fontSize(12)
                      .fontColor('rgba(255, 255, 255, 0.7)')
                      .margin({ top: 2 })
                  }
                  .alignItems(HorizontalAlign.Center)

                  // 获赞与收藏
                  Column() {
                    Text(this.likesCount.toString())
                      .fontSize(13)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Medium)
                    Text("获赞与收藏")
                      .fontSize(12)
                      .fontColor('rgba(255, 255, 255, 0.7)')
                      .margin({ top: 2 })
                  }
                  .alignItems(HorizontalAlign.Center)
                }

                Blank()

                // 右侧按钮组（flexShrink防止压缩）
                Row({ space: -4 }) {
                  // 编辑资料按钮
                  Text("编辑资料")
                    .fontSize(14)
                    .fontColor('#FFF')
                    .width(105)
                    .height(32)
                    .border({ width: 1, color: 'rgba(255,255,255,0.5)', radius: 16 })
                    .textAlign(TextAlign.Center)
                    .margin({ top: -8, bottom: 0 })
                    .padding({ top: 8, bottom: 8 })
                    .onClick(() => {
                      router.pushUrl({ url: 'pages/EditProfilePage' });
                    })

                  Row().width(6)
                  // 设置按钮
                  Row() {
                    Image($r('app.media.ProfilePage_d'))
                      .width(20)
                      .height(20)
                  }
                  .width(40)
                  .height(32)
                  .border({ width: 1, color: 'rgba(255,255,255,0.5)', radius: 16 })
                  .justifyContent(FlexAlign.Center)
                  .alignItems(VerticalAlign.Center)
                }
                .flexShrink(0)
              }
              .width('100%')
              .padding({ left: 20, right: 8, top: 16, bottom: 20 })
              .alignItems(VerticalAlign.Center)

              // 三个快捷功能卡片（创作灵感/RED大赛/浏览记录）
              Row({ space: 9}) {
                // 创作灵感卡片
                Column() {
                  Row({ space: 3 }) {
                    Image($r('app.media.ProfilePage_e'))
                      .width(18)
                      .height(18)
                    Text("创作灵感")
                      .fontSize(13)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Medium)
                  }
                  .alignItems(VerticalAlign.Center)
                  .margin({ bottom: 4 })

                  Text("学创作找灵感")
                    .fontSize(11)
                    .fontColor('rgba(255, 255, 255, 0.6)')
                }
                .width('35%')
                .height(47)
                .padding({ left: 12, top: 9, right: 12, bottom: 12 })
                .backgroundColor('rgba(255, 255, 255, 0.15)')
                .borderRadius(12)
                .alignItems(HorizontalAlign.Start)
                .justifyContent(FlexAlign.Start)
                .onClick(() => {
                  // TODO: 点击创作灵感
                })

                // RED创作大赛
                Column() {
                  Row({ space: 6 }) {
                    Image($r('app.media.ProfilePage_f'))
                      .width(18)
                      .height(18)
                    Text("RED创作大赛")
                      .fontSize(13)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Medium)
                  }
                  .alignItems(VerticalAlign.Center)
                  .margin({ bottom: 4 })

                  Text("为新生代好作品…")
                    .fontSize(11)
                    .fontColor('rgba(255, 255, 255, 0.6)')
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .width('35%')
                .height(47)
                .padding({ left: 12, top: 9, right: 12, bottom: 12 })
                .backgroundColor('rgba(255, 255, 255, 0.15)')
                .borderRadius(12)
                .alignItems(HorizontalAlign.Start)
                .justifyContent(FlexAlign.Start)
                .onClick(() => {
                  // TODO: 点击RED创作大赛
                })

                // 浏览记录
                Column() {
                  Row({ space: 6 }) {
                    Image($r('app.media.ProfilePage_g'))
                      .width(18)
                      .height(18)
                    Text("浏览记录")
                      .fontSize(13)
                      .fontColor('#FFF')
                      .fontWeight(FontWeight.Medium)
                  }
                  .alignItems(VerticalAlign.Center)
                  .margin({ bottom: 4 })

                  Text("看过的笔记")
                    .fontSize(11)
                    .fontColor('rgba(255, 255, 255, 0.6)')
                }
                .width('28%')
                .height(47)
                .padding({ left: 12, top: 9, right: 12, bottom: 12 })
                .backgroundColor('rgba(255, 255, 255, 0.15)')
                .borderRadius(12)
                .alignItems(HorizontalAlign.Start)
                .justifyContent(FlexAlign.Start)
                .onClick(() => {
                  // TODO: 点击浏览记录
                })
              }
              .width('100%')
              .padding({ left: 7, right: 20, bottom: 20 })
            }
            .width('100%')
            .linearGradient({
              angle: 135,
              colors: [['#3A3A5E', 0.0], ['#2A2A3E', 1.0]]
            })
          }
          .width('100%')

          // ---------- 白色内容区块（Tab栏 + 内容区）----------
          Column() {
            // 一级Tab栏（笔记/评论/收藏/赞过）
            Row() {
              Row({ space: 4 }) {
                Text("笔记")
                  .fontSize(17)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#1A1A1A')
              }
              .width(60)

              Row({ space: 4 }) {
                Image($r('app.media.ProfilePage_j'))
                  .width(19)
                  .height(19)
                Text("评论")
                  .fontSize(16)
                  .fontColor('#999')
              }
              .width(72)

              Row({ space: 4 }) {
                Image($r('app.media.ProfilePage_j'))
                  .width(19)
                  .height(19)
                Text("收藏")
                  .fontSize(16)
                  .fontColor('#999')
              }
              .width(72)

              Row({ space: 4 }) {
                Image($r('app.media.ProfilePage_j'))
                  .width(19)
                  .height(19)
                Text("赞过")
                  .fontSize(16)
                  .fontColor('#999')
              }
              .width(72)

              Blank()

              Image($r('app.media.ProfilePage_k'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(48)
            .padding({ left: 20, right: 20 })
            .alignItems(VerticalAlign.Center)

            // 选中指示器（笔记下方的红线）
            if (this.profileTabIndex === 0) {
              Row() {
                Text("")
                  .width(32)
                  .height(3)
                  .backgroundColor('#FF2442')
                  .borderRadius(1.5)
                  .margin({ left: 20 })
              }
              .width('100%')
              .height(3)
            }

            // 子Tab（仅在"笔记"tab下显示：公开/私密/合集）
            if (this.profileTabIndex === 0) {
              Row({ space: 28 }) {
                Row({ space: 4 }) {
                  Text(`公开 ${this.publicNotes}`)
                    .fontSize(14)
                    .fontColor('#333')
                    .fontWeight(FontWeight.Medium)
                }
                Row({ space: 4 }) {
                  Image($r('app.media.ProfilePage_j'))
                    .width(14)
                    .height(14)
                  Text(`私密 ${this.privateNotes}`)
                    .fontSize(14)
                    .fontColor('#999')
                }
                Row({ space: 4 }) {
                  Text(`合集 ${this.collections}`)
                    .fontSize(14)
                    .fontColor('#999')
                }
              }
              .width('100%')
              .padding({ left: 20, top: 12, bottom: 12 })
              .border({ width: { bottom: 0.5 }, color: '#E8E8E8' })
            }

            // 内容区域(动态切换)
            if (this.profileTabIndex === 0) {
              // 笔记空状态
              Column() {
                // 空状态插画（模拟图片占位）
                Circle({ width: 100, height: 100 })
                  .fill('#FFFFFF')
                  .margin({ top: 70, bottom: 20 })
                Image($r('app.media.ProfilePage_l'))
                  .width(100)
                  .height(100)
                  .position({ x: 129, y: 69 })
                  .opacity(0.7)

                Text("分享你一直在路上的状态")
                  .fontSize(15)
                  .fontColor('#999')
                  .margin({ top: 20, bottom: 32 })

                // 去发布按钮
                Text("去发布")
                  .fontSize(15)
                  .fontColor('#333')
                  .width(140)
                  .height(44)
                  .border({ width: 0.8, color: '#DDD', radius: 22 })
                  .textAlign(TextAlign.Center)
                  .lineHeight(20)
              }
              .width('100%')
              .height(400)
              .justifyContent(FlexAlign.Start)
              .alignItems(HorizontalAlign.Center)
            } else {
              // 其他tab的空状态占位（评论/收藏/赞过）
              Column() {
                Text("📭")
                  .fontSize(56)
                  .opacity(0.5)
                  .margin({ top: 80, bottom: 16 })
                Text("暂无内容")
                  .fontSize(15)
                  .fontColor('#999')
              }
              .width('100%')
              .height(300)
              .justifyContent(FlexAlign.Center)
              .alignItems(HorizontalAlign.Center)
            }
          }
          .width('100%')
          .backgroundColor('#F5F5F5')
          .borderRadius({ topLeft: 16, topRight: 16 })
          .margin({ top: -15 })
          .padding({ bottom: 80 })
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .backgroundColor('#F8F8F8')

      // ---------- 底部导航栏（完全复刻小红书样式）----------
      Row() {
        // 首页
        this.NavItem("", "首页", 0)
        // 购物
        this.NavItem("", "市集", 1)
        // 中间发布按钮
        Column() {
          Text("+")
            .fontSize(32)
            .fontColor('#FFF')
            .fontWeight(FontWeight.Bold)
            .lineHeight(34)
        }
        .width(45)
        .height(30)
        .backgroundColor('#FF2442')
        .borderRadius(8)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .margin({ left: 5, right: 5, bottom: 0 })
        .onClick(() => {
          this.isShowPublishSheet = true;
        })
        // 消息
        this.NavItem("", "消息", 3)
        // 我（高亮）
        this.NavItem("", "我的", 4)
      }
      .width('100%')
      .height(60)
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)
      .border({ width: { top: 0.5 }, color: '#E8E8E8' })

      if (this.isShowPublishSheet) {
        this.buildPublishSheet()
      }
    }
    .width('100%')
    .height('100%')
  }

  // 底部导航项构建器（统一图标+文字）
  @Builder
  NavItem(icon: string, text: string, index: number) {
    Column() {
      if (icon !== "") {
        Text(icon)
          .fontSize(20)
          .fontColor(index === this.bottomNavIndex ? '#333' : '#999')
          .margin({ bottom: 4 })
      }

      Text(text)
        .fontSize(18)
        .fontColor(index === this.bottomNavIndex ? '#333' : '#999')
        .fontWeight(index === this.bottomNavIndex ? FontWeight.Medium : FontWeight.Normal)
    }
    .width(60)
    .height(52)
    .margin({ top: 2 })
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      if (index === 0) {
        router.replaceUrl({ url: 'pages/Index' });
      } else if (index === 1) {
        router.replaceUrl({ url: 'pages/MarketPage' });
      } else if (index === 3) {
        router.replaceUrl({ url: 'pages/MessagePage' });
      } else {
        this.bottomNavIndex = index;
      }
    })
  }

  @Builder
  buildPublishSheet() {
    Stack() {
      // 半透明背景遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#80000000')
        .onClick(() => {
          this.isShowPublishSheet = false;
        })

      // 底部弹窗内容
      Column() {
        // 从相册选择
        Column() {
          Text("从相册选择")
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
          // TODO: 实现从相册选择功能
        })

        Divider().color('#E8E8E8').strokeWidth(0.5)

        // 相机
        Column() {
          Text("相机")
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
          Text("拍摄与直播")
            .fontSize(13)
            .fontColor('#999')
            .margin({ top: 4 })
        }
        .width('100%')
        .height(70)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
          // TODO: 实现相机功能
        })

        Divider().color('#E8E8E8').strokeWidth(0.5)

        // 写文字
        Column() {
          Text("写文字")
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
          // TODO: 实现写文字功能
        })

        // 灰色间隙
        Column()
          .width('100%')
          .height(8)
          .backgroundColor('#F5F5F5')

        Column() {
          Text("取消")
            .fontSize(18)
            .fontColor('#666')
        }
        .width('100%')
        .height(50)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.isShowPublishSheet = false;
        })
      }
      .width('100%')
      .backgroundColor('#FFF')
      .borderRadius({ topLeft: 16, topRight: 16 })
      .position({ x: 0, y: '100%' })
      .translate({ y: '-100%' })
    }
    .width('100%')
    .height('100%')
  }
}