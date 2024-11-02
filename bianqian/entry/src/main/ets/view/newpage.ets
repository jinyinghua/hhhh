import { util } from '@kit.ArkTS'
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { text } from '@kit.ArkGraphics2D';


export class note {
  key: string = util.generateRandomUUID(true);
  name: string;
  title: string;

  constructor(name: string,title: string) {
    this.name = name;
    this.title = title;
  }
}

@Entry
@Component
struct newpage {
  @State toDoData: note[] = []
  @State isEditMode: boolean = false
  @State selectedItems: note[] = []
  private notes: Array<object> = []

  build() {
    Column({ space: 9 }) {
      Row({ space:250 }){
        Button({ type: ButtonType.Circle, stateEffect: true }){
          Image($r('app.media.chevron_left')).width(20).height(20)
        }.width(45).height(45)
        .backgroundColor('#b7d3d3d3')
          .onClick(() => {
            console.info(`Succeeded in clicking the '点击返回' button.`)
            try {
              router.back()
              console.info('Succeeded in returning to the first page.')
            }catch(err) {
              let code = (err as BusinessError).code;
              let message = (err as BusinessError).message;
              console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)
            }
          })
        Button(){
          Image($r('app.media.save')).width(25).height(25)
            .width(20)

        }
        .backgroundColor('#b7d3d3d3')
        .width(45).height(45)
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Back' button.`)
          try {
            router.back()
            console.info('Succeeded in returning to the first page.')
          }catch(err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)
          }
          this.notes.push(new note('h','h'),);
        })
      }
      TextInput({ text:''})
      TextArea({placeholder:'点击键入内容' })
        .onChange((value: string) => {
          console.info(value);
        })
        .backgroundColor($r('sys.color.white'))
    }
  }
}
