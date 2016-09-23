/**
* Copyright IBM Corporation 2016
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

// Kitura-Starter-Bluemix contains examples for creating custom routes.
import Foundation
import Kitura
import KituraNet
import LoggerAPI
import HeliumLogger
import SwiftyJSON
import CloudFoundryEnv
import CloudFoundryDeploymentTracker

// Disable all buffering on stdout
setbuf(stdout, nil)

// All web apps need a Router instance to define routes
let router = Router()

// Using the HeliumLogger implementation for Logger
Log.logger = HeliumLogger()

// Serve static content from "public"
router.all("/static", middleware: StaticFileServer())

// Basic GET request
router.get("/hello") { _, response, next in
  Log.debug("GET - /hello route handler...")
  response.headers["Content-Type"] = "text/plain; charset=utf-8"
  try response.status(.OK).send("Hello from Kitura-Starter-Bluemix!").end()
}

// Basic POST request
router.post("/hello") { request, response, next in
  Log.debug("POST - /hello route handler...")
  response.headers["Content-Type"] = "text/plain; charset=utf-8"
  if let name = try request.readString() {
    try response.status(.OK).send("Hello \(name), from Kitura-Starter-Bluemix!").end()
  } else {
    try response.status(.OK).send("Kitura-Starter-Bluemix received a POST request!").end()
  }
}

// JSON Get request
router.get("/json") { _, response, next in
  Log.debug("GET - /json route handler...")
  response.headers["Content-Type"] = "text/json; charset=utf-8"
  var jsonResponse = JSON([:])
  jsonResponse["framework"].stringValue = "Kitura"
  jsonResponse["applicationName"].stringValue = "Kitura-Starter-Bluemix"
  jsonResponse["company"].stringValue = "IBM"
  jsonResponse["organization"].stringValue = "Swift @ IBM"
  jsonResponse["location"].stringValue = "Austin, Texas"
  try response.status(.OK).send(json: jsonResponse).end()
}

// Start Kitura-Starter-Bluemix server
do {
  let appEnv = try CloudFoundryEnv.getAppEnv()
  let port: Int = appEnv.port
  Log.info("Server will be started on '\(appEnv.url)'.")
  CloudFoundryDeploymentTracker(repositoryURL: "https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git", codeVersion: nil).track()
  Kitura.addHTTPServer(onPort: port, with: router)
  Kitura.run()
} catch CloudFoundryEnvError.InvalidValue {
  Log.error("Oops... something went wrong. Server did not start!")
}
