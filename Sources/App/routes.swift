import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    let jsonController = JSONController()
    router.get("json", use: jsonController.get)

    let plainTextController = PlainTextController()
    router.get("plaintext", use: plainTextController.get)

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)

    router.get("/") { req in
        return try req.view().render("StaticFile.html")
    }

    router.get("log") { req -> String in 
        let logger = try req.make(Logger.self)
        logger.info("Hello, World!")
        return "Hello, world!" 
    }

}
