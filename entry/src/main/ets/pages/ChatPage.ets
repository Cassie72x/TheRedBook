import router from '@ohos.router';

interface ChatMessage {
  id: number;
  content: string;
  isMe: boolean;
  timestamp?: string;
  avatar?: Resource;
  isImage?: boolean;
}

interface QuickReply {
  icon: string;
  text: string;
}

interface ChatParams {
  userName: string;
  avatar: Resource;
}

@Entry
@Component
struct ChatPage {
  @State displayUserName: string = '饺子大王';
  @State displayAvatar: Resource = $r('app.media.MessagePage_c');
  @State messages: ChatMessage[] = [];
  @State showFollowBanner: boolean = true;
  @State inputText: string = '';
  private scroller: Scroller = new Scroller();

  aboutToAppear() {
    const params = router.getParams() as ChatParams;
    if (params) {
      this.displayUserName = params.userName ? params.userName : '用户';
      if (params.avatar) {
        this.displayAvatar = params.avatar;
      }
    }
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        // 返回按钮 + 头像 + 用户名
        Row() {
          // 返回箭头图标
          Text("←")
            .fontSize(24)
            .fontColor('#333')
            .margin({ right: 8 })
            .onClick(() => {
              router.back();
            })
          
          Image(this.displayAvatar)
            .width(36)
            .height(36)
            .borderRadius(18)
          
          Text(this.displayUserName)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333')
            .margin({ left: 8 })
        }
        .layoutWeight(1)

        // 更多选项
        Text('···')
          .fontSize(20)
          .fontColor('#333')
          .margin({ right: 12 })
      }
      .height(44)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .padding({ left: 12, right: 12 })
      .backgroundColor('#FFF')

      // 关注提示栏
      if (this.showFollowBanner) {
        Row() {
          Text('加个关注，方便以后常聊')
            .fontSize(14)
            .fontColor('#333')
            .layoutWeight(1)
          
          Text('关注')
            .fontSize(14)
            .fontColor('#FFF')
            .backgroundColor('#FF2442')
            .padding({ left: 20, right: 20, top: 6, bottom: 6 })
            .borderRadius(18)
            .margin({ left: 12 })
          
          Text('×')
            .fontSize(20)
            .fontColor('#999')
            .margin({ left: 12 })
            .onClick(() => {
              this.showFollowBanner = false;
            })
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 10, bottom: 10 })
        .backgroundColor('#FFF')
        .alignItems(VerticalAlign.Center)
      }

      // 聊天消息列表
      Scroll(this.scroller) {
        Column() {
          if (this.messages.length === 0) {
            // 空状态
            Column() {
              Text('开始聊天吧')
                .fontSize(15)
                .fontColor('#CCC')
            }
            .width('100%')
            .height(300)
            .justifyContent(FlexAlign.Center)
          } else {
            ForEach(this.messages, (item: ChatMessage, index: number) => {
              if (item.timestamp) {
                // 时间
                Text(item.timestamp)
                  .fontSize(13)
                  .fontColor('#999')
                  .width('100%')
                  .textAlign(TextAlign.Center)
                  .margin({ top: 16, bottom: 16 })
              }
              
              if (item.isMe) {
                // 我发送的消息（右侧）
                Row() {
                  Blank()
                  
                  Column() {
                    if (item.isImage) {
                      // 表情图片
                      Text(item.content)
                        .fontSize(60)
                    } else {
                      // 文字消息
                      Text(item.content)
                        .fontSize(15)
                        .fontColor('#FFF')
                        .padding({ left: 14, right: 14, top: 10, bottom: 10 })
                        .backgroundColor('#4C8DFF')
                        .borderRadius({ topLeft: 16, topRight: 16, bottomLeft: 16, bottomRight: 4 })
                        .constraintSize({ maxWidth: '60%' })
                    }
                  }
                  .margin({ right: 10 })
                  
                  // 我的头像
                  Image($r('app.media.EditProfilePage_up'))
                    .width(36)
                    .height(36)
                    .borderRadius(18)
                }
                .width('100%')
                .padding({ left: 60, right: 12, top: 4, bottom: 4 })
                .alignItems(VerticalAlign.Top)
              } else {
                // 对方发送的消息（左侧）
                Row() {
                  // 对方头像
                  Image(this.displayAvatar)
                    .width(36)
                    .height(36)
                    .borderRadius(18)
                    .margin({ right: 10 })
                  
                  Column() {
                    Text(item.content)
                      .fontSize(15)
                      .fontColor('#333')
                      .padding({ left: 14, right: 14, top: 10, bottom: 10 })
                      .backgroundColor('#F5F5F5')
                      .borderRadius({ topLeft: 16, topRight: 16, bottomLeft: 4, bottomRight: 16 })
                      .constraintSize({ maxWidth: '60%' })
                  }
                }
                .width('100%')
                .padding({ left: 12, right: 60, top: 4, bottom: 4 })
                .alignItems(VerticalAlign.Top)
              }
            }, (item: ChatMessage) => item.id.toString())
          }
        }
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#FFF')
      .scrollBar(BarState.Off)

      // 底部输入框
      Row() {
        // 语音按钮 - speaking图片
        Image($r('app.media.speaking'))
          .width(24)
          .height(24)
          .margin({ left: 8, right: 8 })
        
        // 输入框
        TextInput({ placeholder: '发消息...', text: this.inputText })
          .layoutWeight(1)
          .height(36)
          .backgroundColor('#F5F5F5')
          .borderRadius(18)
          .padding({ left: 16, right: 16 })
          .fontSize(15)
          .onChange((value: string) => {
            this.inputText = value;
          })
          .onSubmit(() => {
            this.sendMessage();
          })
        
        // 表情按钮 - smile图片
        Image($r('app.media.smile'))
          .width(24)
          .height(24)
          .margin({ left: 8, right: 8 })
        
        // 加号按钮 - add图片
        Image($r('app.media.add'))
          .width(24)
          .height(24)
          .margin({ left: 4, right: 8 })
      }
      .width('100%')
      .height(50)
      .backgroundColor('#FFF')
      .alignItems(VerticalAlign.Center)
      .border({ width: { top: 0.5 }, color: '#E8E8E8' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
  }

  // 发送消息
  sendMessage() {
    if (this.inputText.trim().length === 0) {
      return;
    }
    
    const now = new Date();
    const hours = now.getHours();
    const minutes = now.getMinutes();
    const timeStr = (hours < 10 ? '0' + hours : hours) + ':' + (minutes < 10 ? '0' + minutes : minutes);
    
    const newMessage: ChatMessage = {
      id: this.messages.length + 1,
      content: this.inputText,
      isMe: true,
      timestamp: timeStr
    };
    
    this.messages.push(newMessage);
    this.inputText = '';
    
    setTimeout(() => {
      this.scroller.scrollEdge(Edge.Bottom);
    }, 100);
  }
}
