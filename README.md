![Kitura](https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Documentation/KituraLogo.png)

[![Build Status - Develop](https://travis-ci.org/IBM-Swift/Kitura-Starter-Bluemix.svg?branch=develop)](https://travis-ci.org/IBM-Swift/Kitura-Starter-Bluemix)
![macOS](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)
[![Join the chat at https://gitter.im/IBM-Swift/Kitura](https://badges.gitter.im/IBM-Swift/Kitura.svg)](https://gitter.im/IBM-Swift/Kitura?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![Bluemix Deployments](https://deployment-tracker.mybluemix.net/stats/c42412830c143a76568abe1fb2c0b3ea/badge.svg)

**Bluemix starter application for Kitura web framework and HTTP server**

## Kitura-Starter-Bluemix Overview
Kitura-Starter-Bluemix is a [Kitura](https://github.com/IBM-Swift/Kitura) based server application that you can use as a starting point to get your own Kitura application up and running on Bluemix. Also, if you'd like to run this app locally, you can do so on your [macOS](http://www.apple.com/osx/) or [Ubuntu 14.04](http://www.ubuntu.com/download) system.

## Application Requirements
To compile and run this starter application on your local system, you need to install the [Swift compiler](https://swift.org/download/) for your platform. This version of Kitura-Starter-Bluemix works with the Swift `3.0` release binaries. You can download this version of the Swift binaries by following this [link](https://swift.org/download/). Compatibility with other Swift versions is not guaranteed.

For further details on executing Kitura-based applications locally, please see Kitura's instructions for installation on [macOS ](https://github.com/IBM-Swift/Kitura#installation-os-x) and on [Linux](https://github.com/IBM-Swift/Kitura#installation-linux-apt-based) since system level dependencies may need to be installed before attempting to execute this starter app.

If you are interested in manually deploying the application to Bluemix, you'd need to install the Cloud Foundry [command line](https://docs.cloudfoundry.org/devguide/cf-cli/install-go-cli.html) on your system.  Once it is installed, you can use it to [authenticate and access](https://www.ng.bluemix.net/docs/starters/install_cli.html) your Bluemix organization(s) and spaces.  You can find further details on how to deploy this sample application to Bluemix in the following sections.

## Clone, build, and run locally
Once you have installed the Swift compiler and any system level dependencies required by the Kitura framework, you can proceed with the steps described in this section.

1. Clone this repo using `git clone https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git` and go to the root folder using `cd Kitura-Starter-Bluemix`. Please do not use the GitHub `Download ZIP` button as a way to clone this repo.

2. Go to the root folder of this repo on your system and issue the following command to compile and execute the starter app: `make run`:

```
$ make run
make SWIFT_BUILD_CONFIGURATION="debug" SWIFTC_FLAGS="-Xswiftc -DDEBUG" _build
--- Running build on Darwin
--- Build scripts directory: Package-Builder/build
--- Checking swift version
swift --version
Apple Swift version 3.0 (swiftlang-800.0.46.2 clang-800.0.38)
Target: x86_64-apple-macosx10.9
--- Checking swiftc version
swiftc --version
Apple Swift version 3.0 (swiftlang-800.0.46.2 clang-800.0.38)
Target: x86_64-apple-macosx10.9
--- Checking git version
git --version
git version 2.8.4 (Apple Git-73)
--- Checking git revision and branch
git rev-parse HEAD
33ba1650a8661cc34a63ebb62991aa1cf96f6c0c
git rev-parse --abbrev-ref HEAD
develop
--- Invoking swift build
swift build -c debug -Xswiftc -DDEBUG  
Compile CHTTPParser utils.c
Compile CHTTPParser http_parser.c
Compile Swift Module 'Socket' (3 sources)
Compile Swift Module 'LoggerAPI' (1 sources)
Compile Swift Module 'SwiftyJSON' (2 sources)
Compile Swift Module 'KituraTemplateEngine' (1 sources)
Compile Swift Module 'HeliumLogger' (1 sources)
Linking CHTTPParser
Compile Swift Module 'SSLService' (1 sources)
Compile Swift Module 'CloudFoundryEnv' (7 sources)
Compile Swift Module 'KituraNet' (29 sources)
Compile Swift Module 'CloudFoundryDeploymentTracker' (1 sources)
Compile Swift Module 'Kitura' (40 sources)
Compile Swift Module 'Kitura_Starter_Bluemix' (2 sources)
Linking ./.build/debug/Kitura-Starter-Bluemix
--- Invoking Kitura-Starter-Bluemix executable
./.build/debug/Kitura-Starter-Bluemix
 VERBOSE: init() Router.swift line 55 - Router initialized
 INFO: Kitura_Starter_Bluemix main.swift line 30 - Server will be started on 'http://localhost:8090'.
 WARNING: buildTrackerJson(appEnv:) DeploymentTracker.swift line 103 - Couldn't get Cloud Foundry App instance.
 WARNING: track() DeploymentTracker.swift line 88 - Failed to build valid JSON for deployment tracker.
 VERBOSE: run() Kitura.swift line 71 - Starting Kitura framework...
 VERBOSE: run() Kitura.swift line 73 - Starting an HTTP Server on port 8090...
 INFO: listen(socket:port:) HTTPServer.swift line 128 - Listening on port 8090
```

Once the server starts, you should see the message _Listening on port 8090_ as shown above. Note that the executable file is located in the `.build/debug` directory: `./.build/debug/Kitura-Starter-Bluemix`.

3. Open your browser at [http://localhost:8090](http://localhost:8090) to access the welcome page for the Kitura-Starter-Bluemix app. This page displays static HTML content served from the Kitura-based server application. Explore the `public` folder to see the HTML file and resources in it.

4. To access a plain text greeting, point your browser to: [http://localhost:8090/hello](http://localhost:8090/hello).

5. To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to the following endpoint: [http://localhost:8090/hello](http://localhost:8090/hello). You should get a text response that includes the string you sent to the endpoint.

6. To receive a JSON payload, point your browser to: [http://localhost:8090/json](http://localhost:8090/json).

## Pushing the application to Bluemix
### Using the Deploy to Bluemix button
Clicking on the button below deploys this sample application to Bluemix. The `manifest.yml` file [included in the repo] is parsed to obtain the name of the application and configuration details. For further details on the structure of the `manifest.yml` file, see the [Cloud Foundry documentation](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html#minimal-manifest).

<!---
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)
-->
[![Deploy to Bluemix](https://deployment-tracker.mybluemix.net/stats/c42412830c143a76568abe1fb2c0b3ea/button.svg)](https://bluemix.net/deploy?repository=https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git)

Once deployment to Bluemix is completed, you should access the route assigned to your application using the web browser of your choice. You should see the welcome page for the Kitura-Starter-Bluemix app.

Note that the [IBM Bluemix buildpack for Swift](https://github.com/IBM-Swift/swift-buildpack) is used for the deployment of this app to Bluemix. This IBM Bluemix buildpack for Swift is currently installed in the following Bluemix regions: US South, United Kingdom, and Sydney.

### Using the Cloud Foundry command line
You should have the Cloud Foundry command line installed on your system and you should be already logged on to Bluemix before you attempt the following steps.

1. From the root folder of this repo on your local system, execute `cf push`.

2. Once the application is pushed to and running on Bluemix, you can access your application route to see the welcome page for the Kitura-Starter-Bluemix app.

## Kitura Wiki
Feel free to visit our [Wiki](https://github.com/IBM-Swift/Kitura/wiki) for our roadmap and some tutorials.

## Privacy Notice
This Swift application includes code to track deployments to [IBM Bluemix](https://www.bluemix.net/) and other Cloud Foundry platforms. The following information is sent to a [Deployment Tracker](https://github.com/IBM-Bluemix/cf-deployment-tracker-service) service on each deployment:

* Swift project code version (if provided)
* Swift project repository URL
* Application Name (`application_name`)
* Space ID (`space_id`)
* Application Version (`application_version`)
* Application URIs (`application_uris`)
* Labels of bound services
* Number of instances for each bound service and associated plan information

This data is collected from the parameters of the `CloudFoundryDeploymentTracker`, the `VCAP_APPLICATION` and `VCAP_SERVICES` environment variables in IBM Bluemix and other Cloud Foundry platforms. This data is used by IBM to track metrics around deployments of sample applications to IBM Bluemix to measure the usefulness of our examples, so that we can continuously improve the content we offer to you. Only deployments of sample applications that include code to ping the Deployment Tracker service will be tracked.

### Disabling Deployment Tracking
Deployment tracking can be disabled by removing the following line from `main.swift`:

    CloudFoundryDeploymentTracker(repositoryURL: "https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git", codeVersion: nil).track()

## License
The Kitura-Starter-Bluemix sample app is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).
