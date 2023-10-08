
/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

@When[os == "linux"]
func getFilePath(): Path {
    let env: Option<String> = getEnv("LD_LIBRARY_PATH")
    match(env) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                throw NoneValueException("Path is empty")
            }
            let paths: Array<String> = str.split(":")
            for (i in 0..paths.size) {
                if(paths[i].contains("bin")) {
                    let j: Int64 = i + 1
                    return Path(paths[j])
                } else {
                    return Path(paths[i])
                }
            }
            throw NoneValueException("Unable to find the pinyin4cj directory")
        case None => throw NoneValueException("")
    }
}

@When[os == "windows"]
func getFilePath(): Path {
    let env: Option<String> = getEnv("Path")
    match(env) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                throw NoneValueException("Path is empty")
            }
            let paths: Array<String> = str.split(":")
            for (i in 0..paths.size) {
                if(paths[i].contains("bin")) {
                    let j: Int64 = i + 1
                    return Path(paths[j])
                } else {
                    return Path(paths[i])
                }
            }
            throw NoneValueException("Unable to find the pinyin4cj directory")
        case None => throw NoneValueException("")
    } 
}