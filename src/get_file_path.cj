
/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import os.*
from std import os.posix.*

func getFilePath(): Path {
    match(getEnv("LD_LIBRARY_PATH")) {
        case Some(str) =>
            if (str.isEmpty() && str.size < 0 && !str.contains(":")) {
                throw NoneValueException("")
            }
            let paths: Array<String> = str.split(":")
            for (path in paths where path.contains("build")) {
                return Path(path)
            }
            throw NoneValueException("")
        case None => throw NoneValueException("")
    }
}
