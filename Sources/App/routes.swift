import Vapor

#if os(Linux)
    import SwiftGlibc

    public func arc4random_uniform(_ max: UInt32) -> Int32 {
        return (SwiftGlibc.rand() % Int32(max-1)) + 1
    }
#endif



/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get("hello") { req in
        return "Hello, world!"
    }

    let jsonController = JSONController()
    router.get("json", use: jsonController.get)

    let plainTextController = PlainTextController()
    router.get("plaintext", use: plainTextController.get)
    
    let blogController = BlogController()
    router.get("blog", use: blogController.get) 
    router.get("blogJSON", use: blogController.json)

    router.get("/") { req in
        return try req.view().render("StaticFile.html")
    }

    router.get("log") { req -> String in 
        let logger = try req.make(Logger.self)
        logger.info("Hello, World!")
        return "Hello, world!" 
    }
}


