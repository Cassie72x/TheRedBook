import router from '@ohos.router';
import { NoteItem, noteData } from '../model/NoteData';

@Component
export struct NoteCard {
  @Prop item: NoteItem;
  noteIndex: number = 0;
  @State localIsLiked: boolean = false;
  
  aboutToAppear() {
    this.localIsLiked = noteData[this.noteIndex].isLiked;
  }
  
  // 格式化数字
  formatLikeCount(count: number): string {
    if (count >= 10000) {
      const wan = count / 10000;
      return wan % 1 === 0 ? `${wan.toFixed(0)}万` : `${wan.toFixed(1)}万`;
    }
    return count.toString();
  }

  build() {
    Column() {
      // 封面图片
      Image(this.item.coverUrl)
        .width('100%')
        .height(this.item.cardHeight)
        .objectFit(ImageFit.Cover)

      // 标题
      Text(this.item.title)
        .fontSize(14)
        .fontColor('#333')
        .fontWeight(FontWeight.Medium)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 6, bottom: 8 })
        .width('100%')
        .padding({ left: 8, right: 8 })

      // 用户信息行
      Row() {
        Image(this.item.avatar)
          .width(20)
          .height(20)
          .borderRadius(10)
          .objectFit(ImageFit.Cover)

        Text(this.item.userName)
          .fontSize(11)
          .fontColor('#999')
          .maxLines(1)
          .layoutWeight(1)
          .margin({ left: 6 })

        // 点赞模块
        Row({ space: 2 }) {
          if (this.localIsLiked) {
            Image($r('app.media.sign_heart_red')).width(14).height(14)
          } else {
            Image($r('app.media.sign_heart')).width(14).height(14)
          }
          Text(this.item.likeCount >= 10000
               ? this.formatLikeCount(this.item.likeCount)
               : this.formatLikeCount(this.item.likeCount + (this.localIsLiked ? 1 : 0)))
            .fontSize(11)
            .fontColor('#999')
        }
        .hitTestBehavior(HitTestMode.Block) // 拦截点击穿透
        .gesture(TapGesture().onAction(() => {
          this.localIsLiked = !this.localIsLiked;
          noteData[this.noteIndex].isLiked = this.localIsLiked;
        }))
        .margin({ right: 4 })
      }
      .width('100%')
      .padding({ left: 8, right: 8, bottom: 8 })
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .backgroundColor('#FFF')
    .onClick(() => {
      router.pushUrl({ url: 'pages/DetailPage', params: this.item });
    })
  }
}