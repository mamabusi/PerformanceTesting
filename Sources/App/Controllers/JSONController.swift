//
//  JSONController.swift
//  App
//
import Vapor

final class JSONController {

    func get(_ req: Request) throws -> Message {
        return Message(message: "Hello, world!")
    }

}
