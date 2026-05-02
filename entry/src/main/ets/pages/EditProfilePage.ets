import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { picker } from '@kit.CoreFileKit';

@Entry
@Component
struct EditProfilePage {
  @State name: string = 'momo';
  @State xhsId: string = '20732088666';
  @State bio: string = '';
  @State gender: string = '';
  @State birthday: string = '';
  @State region: string = '';
  @State occupation: string = '';
  @State school: string = '';
  @State originalInfo: string = '暂未完成原创认证';
  @State backgroundUri: string = '';
  
  // 控制编辑状态
  @State editingField: string = '';
  @State tempValue: string = '';

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text("<")
          .fontSize(24)
          .fontColor('#333')
          .margin({ left: 16 })
          .onClick(() => {
            router.back();
          })

        Text('编辑资料')
          .fontSize(17)
          .fontWeight(FontWeight.Medium)
          .fontColor('#333')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .margin({ top: -8 })

        Text('预览')
          .fontSize(15)
          .fontColor('#ff161515')
          .margin({ right: 16 })
          .onClick(() => {
            router.back();
          })
      }
      .height(44)
      .alignItems(VerticalAlign.Center)
      .width('100%')
      .backgroundColor('#F5F5F5')

      // 头像区域
      Column() {
        Stack({ alignContent: Alignment.BottomEnd }) {
          Image($r('app.media.EditProfilePage_up'))
            .width(90)
            .height(90)
            .borderRadius(45)
            .objectFit(ImageFit.Cover)

          Row() {
            Image($r('app.media.EditProfilePage_camera'))
              .width(16)
              .height(16)
              .fillColor('#FFF')
          }
          .width(26)
          .height(26)
          .backgroundColor('#333')
          .borderRadius(13)
          .justifyContent(FlexAlign.Center)
          .opacity(0.8)
          .onClick(() => {
            this.selectBackgroundImage();
          })
        }
        .margin({ top: 20, bottom: 16 })
      }
      .width('100%')
      .backgroundColor('#F5F5F5')

      // 可滚动内容区
      Scroll() {
        Column({ space: 12 }) {
          // 基础信息卡片
          Column({ space: 0 }) {
            this.buildEditableField('名字', this.name, '请输入名字')
            Divider().color('#F0F0F0')
            this.buildReadonlyField('小红书号', this.xhsId)
            Divider().color('#F0F0F0')
            this.buildBackgroundField()
          }
          .width('100%')
          .backgroundColor('#FFF')
          .borderRadius(12)

          // 简介卡片
          Column({ space: 0 }) {
            this.buildEditableField('简介', this.bio, '介绍一下自己')
          }
          .width('100%')
          .backgroundColor('#FFF')
          .borderRadius(12)

          // 详细信息卡片
          Column({ space: 0 }) {
            this.buildEditableField('性别', this.gender, '编辑性别')
            Divider().color('#F0F0F0')
            this.buildEditableField('生日', this.birthday, '选择生日')
            Divider().color('#F0F0F0')
            this.buildEditableField('地区', this.region, '选择所在的地区')
            Divider().color('#F0F0F0')
            this.buildEditableField('职业', this.occupation, '选择职业')
            Divider().color('#F0F0F0')
            this.buildEditableField('学校', this.school, '选择学校')
            Divider().color('#F0F0F0')
            this.buildReadonlyField('原创信息', this.originalInfo)
          }
          .width('100%')
          .backgroundColor('#FFF')
          .borderRadius(12)
        }
        .width('100%')
        .padding({ left: 12, right: 12, top: 12, bottom: 20 })
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // 可编辑字段（点击后直接显示输入框）
  @Builder
  buildEditableField(label: string, value: string, placeholder: string = '') {
    Column() {
      if (this.editingField === label) {
        // 编辑模式：显示输入框
        Row() {
          Text(label)
            .fontSize(16)
            .fontColor('#999')
            .width(100)

          TextInput({ placeholder: placeholder, text: this.tempValue })
            .fontSize(16)
            .fontColor('#333')
            .placeholderColor('#CCC')
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)
            .onChange((value: string) => {
              this.tempValue = value;
            })
            .onSubmit(() => {
              // 提交编辑
              this.saveField(label, this.tempValue);
            })

          Text("✓")
            .fontSize(20)
            .fontColor('#FF2442')
            .margin({ left: 8 })
            .onClick(() => {
              this.saveField(label, this.tempValue);
            })
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })
        .alignItems(VerticalAlign.Center)
      } else {
        // 显示模式：点击后进入编辑
        Row() {
          Text(label)
            .fontSize(16)
            .fontColor('#999')
            .width(100)

          Text(value || placeholder)
            .fontSize(16)
            .fontColor(value ? '#333' : '#CCC')
            .layoutWeight(1)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })

          Text(">")
            .fontSize(20)
            .fontColor('#CCC')
            .margin({ left: 8 })
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })
        .alignItems(VerticalAlign.Center)
        .onClick(() => {
          this.editingField = label;
          this.tempValue = value;
        })
      }
    }
  }
  
  // 保存字段
  saveField(label: string, value: string) {
    switch (label) {
      case '名字':
        this.name = value;
        break;
      case '简介':
        this.bio = value;
        break;
      case '性别':
        this.gender = value;
        break;
      case '生日':
        this.birthday = value;
        break;
      case '地区':
        this.region = value;
        break;
      case '职业':
        this.occupation = value;
        break;
      case '学校':
        this.school = value;
        break;
    }
    this.editingField = '';
    promptAction.showToast({ message: '保存成功' });
  }
  
  // 只读字段
  @Builder
  buildReadonlyField(label: string, value: string) {
    Row() {
      Text(label)
        .fontSize(16)
        .fontColor('#999')
        .width(100)

      Text(value)
        .fontSize(16)
        .fontColor('#999')
        .layoutWeight(1)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(">")
        .fontSize(20)
        .fontColor('#CCC')
        .margin({ left: 8 })
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .alignItems(VerticalAlign.Center)
  }
  
  // 背景图选择字段
  @Builder
  buildBackgroundField() {
    Row() {
      Text('背景图')
        .fontSize(16)
        .fontColor('#999')
        .width(100)

      if (this.backgroundUri) {
        Image(this.backgroundUri)
          .width(80)
          .height(50)
          .objectFit(ImageFit.Cover)
          .borderRadius(8)
      } else {
        Image($r('app.media.EditProfilePage_back'))
          .width(80)
          .height(50)
          .objectFit(ImageFit.Contain)
          .borderRadius(8)
      }

      Blank()

      Text(">")
        .fontSize(20)
        .fontColor('#CCC')
        .margin({ left: 8 })
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      this.selectBackgroundImage();
    })
  }
  
  // 选择背景图片
  async selectBackgroundImage() {
    try {
      const photoSelectOptions = new picker.PhotoSelectOptions();
      photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      photoSelectOptions.maxSelectNumber = 1;
      
      const photoPicker = new picker.PhotoViewPicker();
      const photoSelectResult = await photoPicker.select(photoSelectOptions);
      
      if (photoSelectResult && photoSelectResult.photoUris && photoSelectResult.photoUris.length > 0) {
        this.backgroundUri = photoSelectResult.photoUris[0];
        promptAction.showToast({ message: '背景图已更新' });
      }
    } catch (err) {
      console.error('选择图片失败：' + JSON.stringify(err));
      if (err && err.code !== 13900042) { // 用户取消选择不报错
        promptAction.showToast({ message: '选择图片失败' });
      }
    }
  }
}
