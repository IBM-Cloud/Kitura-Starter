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
Clicking on the button below deploys this starter application to Bluemix. The `manifest.yml` file [included in the repo] is parsed to obtain the name of the application and configuration details. For further details on the structure of the `manifest.yml` file, see the [Cloud Foundry documentation](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html#minimal-manifest).

<!---
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)
-->
[![Deploy to Bluemix](https://deployment-tracker.mybluemix.net/stats/c42412830c143a76568abe1fb2c0b3ea/button.svg)](https://bluemix.net/deploy?repository=https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git)

Once deployment to Bluemix is completed, you can access the route assigned to your application using the web browser of your choice. You should see the welcome page for the Kitura-Starter-Bluemix app! To access a plain text greeting, point your browser to `http://<application_route>/hello`. To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to `http://<application_route>/hello`. You should get a text response that includes the string you sent to the endpoint. Finally, to receive a JSON payload, point your browser to `http://<application_route>/json`.

Note that the [IBM Bluemix buildpack for Swift](https://github.com/IBM-Swift/swift-buildpack) is used for the deployment of this app to Bluemix. This IBM Bluemix buildpack for Swift is currently installed in the following Bluemix regions: US South, United Kingdom, and Sydney.

### Using the Cloud Foundry command line
You can also manually deploy the app to Bluemix.  Though not as magical as using the Bluemix button above, manually deploying the app gives you some insights about what is happening behind the scenes.  Remember that you'd need the Cloud Foundry [command line](https://www.ng.bluemix.net/docs/starters/install_cli.html) installed on your system to deploy the app to Bluemix.

Using the Cloud Foundry command line you can get a list of the buildpacks (along with their versions) that are installed on Bluemix. Note that you should be already logged on to Bluemix before you issue any of the following commands.

Executing the `cf buildpacks` above command should result in output similar to the following:

```
$ cf buildpacks
Getting buildpacks...

buildpack                              position   enabled   locked   filename
liberty-for-java                       1          true      false    buildpack_liberty-for-java_v3.3-20160912-1729.zip
sdk-for-nodejs                         2          true      false    buildpack_sdk-for-nodejs_v3.7-20160826-1101.zip
dotnet-core                            3          true      false    buildpack_dotnet-core_v1.0-20160826-1345.zip
swift_buildpack                        4          true      false    buildpack_swift_v2.0.0-20160915-1220.zip
java_buildpack                         5          true      false    java-buildpack-v3.6.zip
ruby_buildpack                         6          true      false    ruby_buildpack-cached-v1.6.16.zip
nodejs_buildpack                       7          true      false    nodejs_buildpack-cached-v1.5.11.zip
go_buildpack                           8          true      false    go_buildpack-cached-v1.7.5.zip
python_buildpack                       9          true      false    python_buildpack-cached-v1.5.5.zip
php_buildpack                          10         true      false    php_buildpack-cached-v4.3.10.zip
xpages_buildpack                       11         true      false    xpages_buildpack_v1.1.1-20160518-0936.zip
staticfile_buildpack                   12         true      false    staticfile_buildpack-cached-v1.3.6.zip
binary_buildpack                       13         true      false    binary_buildpack-cached-v1.0.1.zip
xpages_buildpack_v1_0_0-20160310-144   14         true      false    xpages_buildpack_v1.0.0-20160310-1442.zip
swift_buildpack_v1_1_1                 15         true      false    swift_buildpack-cached-v1.1.1.zip
dotnet-core_v0_9-20160706-1603         16         true      false    buildpack_dotnet-core_v0.9-20160706-1603.zip
sdk-for-nodejs_v3_7-20160823-1528      17         true      false    buildpack_sdk-for-nodejs_v3.7-20160823-1528.zip
liberty-for-java_v3_2-20160822-2200    18         true      false    buildpack_liberty-for-java_v3.2-20160822-2200.zip
swift_buildpack_v1_1_6-20160729-1205   19         true      false    buildpack_swift_v1.1.6-20160729-1205.zip
```

Looking at the output above, we can see that the IBM Bluemix buildpack for Swift (v2.0.0) is installed on Bluemix. This will allow a seamless deployment of the starter application to Bluemix. After you have cloned this Git repo, go to its root folder on your system and issue the following command Cloud Foundry command:

```
cf push
```

1. From the root folder of this repo on your local system, execute `cf push`.

2. Once the application is pushed to and running on Bluemix, you can access your application route to see the welcome page for the Kitura-Starter-Bluemix app. You can log on to your [Bluemix account](https://console.ng.bluemix.net) to find the route of your application or you can inspect the output from the execution of the `cf push` command.  The string value (e.g. swift-helloworld.mybluemix.net) shown next to the urls should contain the route.  Use that route as the URL to access the sample server using the browser of your choice.

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
