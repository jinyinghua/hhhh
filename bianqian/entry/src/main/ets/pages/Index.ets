import { note } from '../view/newpage'

import { router } from '@kit.ArkUI'
import { curves } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';

class SetSlt{
  isAnimation:boolean = true
  set():void{
    this.isAnimation = !this.isAnimation;
  }
}

@Entry
@Component
struct Index {
  @State SetAnimation: SetSlt = new SetSlt();
  @State message: string = '便签';
  @State toDoData: note[] = []
  @State isEditMode: boolean = false
  @State selectedItems: note[] = []
  private notes: Array<object> = []

  build() {
    Column({ space: 20}) {
      Row({ space: 10}){
        Button({ type: ButtonType.Circle, stateEffect: true }){
          Image($r('app.media.chevron_left')).width(20).height(20)
        }.width(45).height(45)
        .backgroundColor('#D3D3D3')
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bolder)
      }

      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.notes, (item: note) => {
          ListItem() {
            Text(item.name).fontSize(25).fontWeight(FontWeight.Bold)
              .borderRadius(10)
              .textAlign(TextAlign.Start)
              .width('95%')
              .height('20%')
              .margin({ left: 8 })
              .backgroundColor($r('sys.color.white'))
              .scale({ x: this.SetAnimation.isAnimation ? 1 : 1, y: this.SetAnimation.isAnimation ? 1 : 4 })
              .animation({ curve: curves.springMotion(0.4, 0.8) })
              .onClick(() => {
                this.SetAnimation.set()
              })
          }
        })
        ListItem() {
          Button() {
            Text('+').fontSize(30)
          }
          .type(ButtonType.Normal)
          .borderRadius(10)
          .width('95%')
          .height('20%')
          .margin({ left: 8 })
          .backgroundColor($r('sys.color.white'))
          .onClick(() => {
            console.info(`Succeeded in clicking the '+' button.`)
            router.pushUrl({ url: 'view/newpage' }).then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err: BusinessError) => {
              console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
            })
            })
          }
        }
        .width('100%')
        .height('100%')
      }
      .margin({ top: -15 })
      .height('100%')
      .width('100%')
      .backgroundColor(0xdcdcdc)
    }
}