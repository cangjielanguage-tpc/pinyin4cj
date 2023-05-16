// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from pinyin4cj import pinyin4cj.*

main() {
    var trie: Trie = Trie()
    trie.setPinyin("hao")
    if(trie.getPinyin() != "hao") {
        return -1
    }
    return 0
}

