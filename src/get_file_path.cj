
/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import os.*
from std import os.posix.*

@When[os == "linux"]
func getFilePath(): Path {
    match(getEnv("LD_LIBRARY_PATH")) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                throw NoneValueException("Path is empty")
            }
            let paths: Array<String> = str.split(":")
            for (path in paths where path.contains("pinyin4cj")) {
                return Path(path)
            }
            throw NoneValueException("Unable to find the pinyin4cj directory")
        case None => throw NoneValueException("")
    }
}

@When[os == "windows"]
func getFilePath(): Path {
    match(getEnv("Path")) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(";")) {
                throw NoneValueException("Path is empty")
            }
            println(str)
            let paths: Array<String> = str.split(";")
            println(paths)
            for (path in paths where path.contains("pinyin4cj")) {
                return Path(path)
            }
            throw NoneValueException("Unable to find the pinyin4cj directory")
        case None => throw NoneValueException("")
    }
}

