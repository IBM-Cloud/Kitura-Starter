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

import Kitura
import Foundation
import LoggerAPI
import CloudEnvironment
import Health

struct Project: Codable {
    let framework: String
    let applicationName: String
    let company: String
    let organization: String
    let location: String
}

public class Controller {

  public let router: Router
  let cloudEnv: CloudEnv
  let health: Health
    
  public var port: Int {
    get { return cloudEnv.port }
  }

  public var url: String {
    get { return cloudEnv.url }
  }

  public init() {
    // Create CloudEnv instance
    cloudEnv = CloudEnv()

    // All web apps need a Router instance to define routes
    router = Router()
    
    // Instance of health for reporting heath check values
    health = Health()

    // Serve static content from "public"
    router.all("/", middleware: StaticFileServer())

    // Basic GET request
    router.get("/hello", handler: getHello)

    // Basic POST request
    router.post("/hello", handler: postHello)

    // JSON Get request
    router.get("/json", handler: getJSON)
    
    // Basic application health check
    router.get("/health", handler: getHealthCheck)
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
    response.headers["Content-Type"] = "application/json; charset=utf-8"
    let project = Project(framework: "Kitura", applicationName: "Kitura-Starter",
      company: "IBM", organization: "Swift @ IBM", location: "Austin, Texas")
    // Send codable object as response
    try response.status(.OK).send(project).end()
  }
    
  /**
   * Handler for getting a text/plain response of application health status.
   */
  public func getHealthCheck(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    Log.debug("GET - /health route handler...")
    let status = health.status
    if health.status.state == .UP {
      try response.status(.OK).send(status).end()
    } else {
      try response.status(.serviceUnavailable).send(status).end()
    }
  }

}