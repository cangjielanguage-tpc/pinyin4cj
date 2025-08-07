/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

package pinyin

/*
 * Output Pinyin Format
 *  - WITH_TONE_MARK  hé
 *  - WITHOUT_TONE  he
 *  - WITH_TONE_NUMBER  he2
 *  - FIRST_LETTER h
 */
public enum PinyinFormat {
    | WITH_TONE_MARK
    | WITHOUT_TONE
    | WITH_TONE_NUMBER
    | FIRST_LETTER

    /*
     * Obtain Pinyin Format
     *
     * @return String
     */
    public func getName(): String {
        match(this){
            case WITH_TONE_MARK => return "WITH_TONE_MARK"
            case WITHOUT_TONE => return "WITHOUT_TONE"
            case WITH_TONE_NUMBER => return "WITH_TONE_NUMBER"
            case FIRST_LETTER => return "FIRST_LETTER"
        }
    }

    public static func fromString(str: String): PinyinFormat {
        return match (str) {
        	case "WITH_TONE_MARK" => PinyinFormat.WITH_TONE_MARK
        	case "WITHOUT_TONE" => PinyinFormat.WITHOUT_TONE
        	case "WITH_TONE_NUMBER" => PinyinFormat.WITH_TONE_NUMBER
        	case "FIRST_LETTER" => PinyinFormat.FIRST_LETTER
            case _ => PinyinFormat.WITH_TONE_MARK
        }
    }
}