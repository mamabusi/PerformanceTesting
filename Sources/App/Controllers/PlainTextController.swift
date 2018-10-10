//
//  PlainTextController.swift
//  App
//
import Vapor

final class PlainTextController {

    func get(_ req: Request) throws -> String {
        return "Hello, world!"
    }

}
