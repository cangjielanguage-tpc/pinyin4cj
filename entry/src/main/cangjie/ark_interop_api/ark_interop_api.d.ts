export declare class PinyinHelperArkts {
    convertToPinyinArray(c: string, format: string): Array<string>
    convertToPinyinStringFormat(str: string, separator: string, format: string): string
    convertToPinyinStringTraditional(str: string, separator: string, format: string): string
    convertToPinyinString(str: string, separator: string): string
    getShortPinyin(str: string): string
    hasMultiPinyin(char: string): boolean
    addPinyinDictResource(dict: Map<string, string>): void
    addMutilPinyinDictResource(dict: Map<string, string>): void
    toTongyongPinyinStringArray(char: string): Array<string>
}

export declare class ChineseHelperArkts {
    convertToSimplifiedChinese(str: string): string
    convertToTraditionalChinese(str: string): string
    isTraditionalChinese(c: string): boolean
    isChinese(c: string): boolean
    containsChinese(str: string): boolean
    addChineseDictResource(dict: Map<string, string>): void
}

export declare interface CustomLib {
    ChineseHelperArkts: {new (): ChineseHelperArkts}
    PinyinHelperArkts: {new (): PinyinHelperArkts}
}