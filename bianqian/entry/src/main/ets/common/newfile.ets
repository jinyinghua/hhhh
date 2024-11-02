//数据表
import { util } from '@kit.ArkTS'

export class note {
  key: string = util.generateRandomUUID(true);
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}
