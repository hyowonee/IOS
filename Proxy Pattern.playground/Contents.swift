//: Playground - noun: a place where people can play

class BigData {
    init() {
        print("정말 오래걸리는 초기화")
    }
    
    func run() {
        print("실행")
    }
}

class BigDataProxy {
    var bigData: BigData!
    
    func run() {
        if bigData == nil {
            bigData = BigData()
        }
        bigData.run()
    }
}

/// Case 1
let bigData = BigData() // 이 시점에 오래걸리는 초기화가 실행됨
// ... 무언가 다른 작업들을 함
bigData.run()

/// Case 2
let bigDataProxy = BigDataProxy()
// ... 무언가 다른 작업들을 함
bigDataProxy.run() // 이 시점에 오래걸리는 초기화가 실행됨
