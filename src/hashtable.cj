/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package pinyin4cj

from std import sync.*

/**
 * The class is SyncMap<K, inherited from Hashable & Equatable<K>
 */
class Hashtable<K, V> <: Map<K, V> where K <: Hashable & Equatable<K> {
    private let lock = ReentrantMutex()
    private let map: HashMap<K, V>

    public init(){
        synchronized(lock) {
            this.map = HashMap<K, V>()
        }
    }
    public init(elements: Array<(K,V)>){
        synchronized(lock) {
            this.map  = HashMap<K, V>(elements)
        }
    }
    public init(capacity: Int64){
        synchronized(lock) {
            this.map  = HashMap<K, V>(capacity)
        }
    }
    public init(size: Int64, initElement: (Int64) -> (K, V)){
        synchronized(lock) {
            this.map  = HashMap<K, V>(size, initElement)
        }
    }
    public func put(key: K, value: V): Option<V>{
        synchronized(lock) {
            return this.map.put(key, value)
        }
    }
    public func get(key: K): Option<V>{
        synchronized(lock) {
            return this.map.get(key)
        }
    }
    public func contains(key: K): Bool{
        synchronized(lock) {
            return this.map.contains(key)
        }
    }
    public func containsAll(keys: Collection<K>): Bool{
        synchronized(lock) {
            return this.map.containsAll(keys)
        }
    }
    public func putAll(elements: Collection<(K, V)>): Unit{
        synchronized(lock) {
            this.map.putAll(elements)
        }
    }
    public func remove(key: K): Option<V>{
        synchronized(lock) {
            return this.map.remove(key)
        }
    }
    public func removeAll(keys: Collection<K>): Unit{
        synchronized(lock) {
            this.map.removeAll(keys)
        }
    }
    public func removeIf(predicate: (K, V) -> Bool): Unit{
        synchronized(lock) {
            return this.map.removeIf(predicate)
        }
    }
    public func clear(): Unit{
        synchronized(lock) {
            return this.map.clear()
        }
    }
    public func reserve(additional: Int64): Unit{
        synchronized(lock) {
            return this.map.reserve(additional)
        }
    }
    public func capacity(): Int64{
        synchronized(lock) {
            return this.map.capacity()
        }
    }
    public func clone(): HashMap<K, V>{
        synchronized(lock) {
            return this.map.clone()
        }
    }
    public func keys(): Keys<K>{
        synchronized(lock) {
            return this.map.keys()
        }
    }
    public func values(): Values<V>{
        synchronized(lock) {
            return this.map.values()
        }
    }
    public func iterator(): HashMapIterator<K, V>{
        synchronized(lock) {
            return HashMap<K,V>(this.map).iterator()
        }
    }
    public prop let size: Int64 {
        get () {
            synchronized(lock) {
                return this.map.size
            }
        }
    }
    public func isEmpty(): Bool{
        synchronized(lock) {
            return this.map.isEmpty()
        }
    }
    public operator func [](key: K, value!: V): Unit{
        synchronized(lock) {
            this.map.put(key,value)
            ()
        }
    }
    public operator func [](key: K): V{
        synchronized(lock) {
            return this.map[key]
        }
    }
}
