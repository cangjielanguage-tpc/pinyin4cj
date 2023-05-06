/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

class ResourceHelper {
    static func getResourceInputStream(resourceName: String): File {
        return File(resourceName, Open(true, false))
  }
}
