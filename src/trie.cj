/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import io.*
from std import fs.*
from std import format.*

public class Trie {

    //The values contained in this node
    private var values: Map<String, Trie> = Hashtable<String, Trie>()

    //Pinyin of this node
    private var pinyin: String = ""

    //Next node, which matches the next character
    private var nextTire: ?Trie = None

    private let lock = ReentrantMutex()

    public func getPinyin(): String {
        return pinyin
    }

    public func setPinyin(pinyin: String): Unit {
        this.pinyin = pinyin
    }

    public func getNextTire(): ?Trie {
        return nextTire
    }

    public func setNextTire(nextTire: Trie): Unit {
        this.nextTire = nextTire
    }

    /**
     * Load Pinyin
     *
     * @param inStream - Pinyin file input stream
     */
    public func load(inStream: InputStream): Unit {
        var bufferedReader: StringReader = StringReader(inStream)
        var s: String = ""
        while(let Some(i) = bufferedReader.readln()) {
            var keyAndValue: Array<String> = i.split(" ")
            if (keyAndValue.size != 2) {
                continue
            }                           
            var trie: Trie = Trie()
            trie.pinyin = keyAndValue[1]
            put(keyAndValue[0], trie)           
        }          
    }

    /**
     * Load polyphonic pinyin dictionary
     *
     * @param inStream Pinyin file input stream
     */
    public func loadMultiPinyin(inStream: InputStream): Unit {
        var stream: InputStream = inStream
        var bufferedReader: StringReader = StringReader(inStream)
        var s: String = ""
        while(let Some(i) = bufferedReader.readln()) {
            var keyAndValue: Array<String> = i.split(" ")
            if (keyAndValue.size != 2) {
                continue
            }
            var key: String = keyAndValue[0]//String with more than one word
            var value: String = keyAndValue[1]//Pinyin of strings
            var keys: Array<Char> = key.toCharArray()

            var currentTrie: Trie = this
            var j: Int64 = 0
            for (k in 0..keys.size) {
                var hexString: String = UInt32(keys[j]).format("0x").toUpper()
                var trieParent: ?Trie = currentTrie.get(hexString)
                match (trieParent) {//If there is no such value, simply put in an empty object
                    case Some(t) => ()
                    case None =>
                        currentTrie.put(hexString, Trie())
                        trieParent = currentTrie.get(hexString)
                }
                if (keys.size - 1 == j) {//The last word needs to be written in Pinyin
                    trieParent.getOrThrow().pinyin = value
                    break
                }

                var trie: ?Trie = trieParent.getOrThrow().getNextTire()//Get the next object for this object
                match (trie) {
                    case Some(t) =>  currentTrie = trie.getOrThrow()
                    case None => 
                        if (keys.size - 1 != j) {
                        //Not the last word, write the nextTrie of this word and match it with the next one
                        var subTrie: Trie = Trie()
                        trieParent.getOrThrow().setNextTire(subTrie)
                        subTrie.put(UInt32(keys[j + 1]).format("0x").toUpper(), Trie())
                        currentTrie = subTrie
                    }
                }   
                j++
            }
                
        }
        
    }

    public func get(hexString: String): ?Trie {
        return values.get(hexString)
    }

    public func put(s: String, trie: Trie): Unit {
        values.put(s, trie)
    }
}
