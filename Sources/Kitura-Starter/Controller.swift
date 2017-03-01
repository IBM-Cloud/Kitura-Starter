/**
* Copyright IBM Corporation 2016,2017
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

import Foundation
import Kitura
import SwiftyJSON
import LoggerAPI
import Configuration
import CloudFoundryEnv
import CloudFoundryConfig

public class Controller {

  let router: Router
  let configMgr: ConfigurationManager
  var jsonEndpointEnabled: Bool = true
  var jsonEndpointDelay: UInt32 = 0

  var port: Int {
    get { return configMgr.port }
  }

  var url: String {
    get { return configMgr.url }
  }

  init() throws {
    configMgr = ConfigurationManager().load(.environmentVariables)

    // All web apps need a Router instance to define routes
    router = Router()

    // Serve static content from "public"
    router.all("/", middleware: StaticFileServer())

    // Basic GET request
    router.get("/hello", handler: getHello)

    // Basic POST request
    router.post("/hello", handler: postHello)

    // JSON Get request
    router.get("/json", handler: getJSON)

    // Manage /json endpoint
    router.post("/jsonEndpointManager", middleware: BodyParser())
    router.post("/jsonEndpointManager", handler: jsonEndpointManager)
  }

  /**
  * Handler for getting a text/plain response.
  */
  public func getHello(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("GET - /hello route handler...")
    response.headers["Content-Type"] = "text/plain; charset=utf-8"
    try response.status(.OK).send("Hello from Kitura-Starter!").end()
  }

  /**
  * Handler for posting the name of the entity to say hello to (a text/plain response).
  */
  public func postHello(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("POST - /hello route handler...")
    response.headers["Content-Type"] = "text/plain; charset=utf-8"
    if let name = try request.readString() {
      try response.status(.OK).send("Hello \(name), from Kitura-Starter!").end()
    } else {
      try response.status(.OK).send("Kitura-Starter received a POST request!").end()
    }
  }

  /**
  * Handler for getting an application/json response.
  */
  public func getJSON(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("GET - /json route handler...")
    if self.jsonEndpointEnabled {
      response.headers["Content-Type"] = "application/json; charset=utf-8"
      var jsonResponse = JSON([:])
      jsonResponse["framework"].stringValue = "Kitura"
      jsonResponse["applicationName"].stringValue = "Kitura-Starter"
      jsonResponse["company"].stringValue = "IBM"
      jsonResponse["organization"].stringValue = "Swift @ IBM"
      jsonResponse["location"].stringValue = "Austin, Texas"
      sleep(self.jsonEndpointDelay)
      try response.status(.OK).send(json: jsonResponse).end()
    } else {
      next()
    }
  }

  /**
  * Handler for managing the /json endpoint.
  */
  public func jsonEndpointManager(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("POST - /enable route handler...")
    response.headers["Content-Type"] = "text/plain; charset=utf-8"
    guard let jsonPayload = request.body?.asJSON else {
      try response.status(.badRequest).send("JSON payload not provided!").end()
      return
    }
    guard let enabled = jsonPayload["enabled"].bool,
      let delay = jsonPayload["delay"].int else {
        try response.status(.badRequest).send("Required fields in JSON payload not found!").end()
        return
    }

    self.jsonEndpointEnabled = enabled
    self.jsonEndpointDelay = UInt32(delay)
    try response.status(.OK).send("/json endpoint settings updated!").end()
  }

}
