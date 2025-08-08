import { ChineseHelperArkts, PinyinHelperArkts } from 'libpinyin.so'


export class ChineseHelper {
  helper: ChineseHelperArkts = new ChineseHelperArkts()

  convertToSimplifiedChinese(str: string): string {
    return this.helper.convertToSimplifiedChinese(str)
  }

  convertToTraditionalChinese(str: string): string{
    return this.helper.convertToTraditionalChinese(str)
  }
  isTraditionalChinese(c: string): boolean{
    return this.helper.isTraditionalChinese(c)
  }
  isChinese(c: string): boolean{
    return this.helper.isChinese(c)
  }
  containsChinese(str: string): boolean{
    return this.helper.containsChinese(str)
  }
  addChineseDictResource(dict: Map<string, string>): void{
    return this.helper.addChineseDictResource(dict)
  }
  constructor (){}
}

export class PinyinHelper {
  helper: PinyinHelperArkts = new PinyinHelperArkts()

  convertToPinyinArray(c: string, format: string): Array<string>{
    return this.helper.convertToPinyinArray(c, format)
  }
  convertToPinyinStringFormat(str: string, separator: string, format: string): string{
    return this.helper.convertToPinyinStringFormat(str, separator, format)
  }
  convertToPinyinStringTraditional(str: string, separator: string, format: string): string{
    return this.helper.convertToPinyinStringTraditional(str, separator, format)
  }
  convertToPinyinString(str: string, separator: string): string{
    return this.helper.convertToPinyinString(str, separator)
  }
  getShortPinyin(str: string): string{
    return this.helper.getShortPinyin(str)
  }
  hasMultiPinyin(char: string): boolean{
    return this.helper.hasMultiPinyin(char)
  }
  addPinyinDictResource(dict: Map<string, string>): void{
    return this.helper.addPinyinDictResource(dict)
  }
  addMutilPinyinDictResource(dict: Map<string, string>): void{
    return this.helper.addMutilPinyinDictResource(dict)
  }
  toTongyongPinyinStringArray(char: string): Array<string>{
    return this.helper.toTongyongPinyinStringArray(char)
  }
  constructor (){}
}

export enum PinyinFormat {
  WITH_TONE_MARK = "WITH_TONE_MARK",
  WITHOUT_TONE = "WITHOUT_TONE",
  WITH_TONE_NUMBER = "WITH_TONE_NUMBER",
  FIRST_LETTER = "FIRST_LETTER",
}