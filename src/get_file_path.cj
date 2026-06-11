
/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

package pinyin4cj

import std.env.*
import std.fs.*

@When[os == "Linux"]
func getFilePath(): Path {
    let env: Option<String> = getVariable("LD_LIBRARY_PATH")
    match(env) {
        case Some(str) =>
            if (str.isEmpty() || !str.contains(":")) {
                throw Pinyin4cjException("The path is empty")
            }
            let paths: Array<String> = str.split(":")
            for (path in paths where (path.contains("target/pinyin4cj") || path.contains("target/release/pinyin4cj")) && path.endsWith("pinyin4cj") && exists(path)) {
                return Path(path)
            }
            throw Pinyin4cjException("Unable to find the pinyin4cj directory")
        case None => throw Pinyin4cjException("Invalid path value")
    }
}

@When[os == "Windows"]
func getFilePath(): Path {
    let env: Option<String> = getVariable("Path")
    match(env) {
        case Some(str) =>
            if (str.isEmpty() || !str.contains(";")) {
                throw Pinyin4cjException("The path is empty")
            }
            let paths: Array<String> = str.split(";")
            for (path in paths where (path.contains("target\\pinyin4cj") || path.contains("target\\release\\pinyin4cj")) && path.endsWith("pinyin4cj") && exists(path)) {
                return Path(path)
            }
            throw Pinyin4cjException("Unable to find the pinyin4cj directory")
        case None => throw Pinyin4cjException("Invalid path value")
    } 
}