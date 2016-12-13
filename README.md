![Kitura](https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Documentation/KituraLogo.png)

[![Build Status - Master](https://travis-ci.org/IBM-Bluemix/Kitura-Starter.svg?branch=master)](https://travis-ci.org/IBM-Bluemix/Kitura-Starter)
[![Join the chat at https://gitter.im/IBM-Swift/Kitura](https://badges.gitter.im/IBM-Swift/Kitura.svg)](https://gitter.im/IBM-Swift/Kitura?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![macOS](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)](http://www.apple.com/macos/)
[![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)](http://releases.ubuntu.com/14.04/)
[![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0)
[![Bluemix Deployments](https://deployment-tracker.mybluemix.net/stats/f3517b364e8ee44775acaf9cece55f6c/badge.svg)](https://deployment-tracker.mybluemix.net/)

**Bluemix starter application for Kitura web framework and HTTP server**

## What is Kitura?
[Kitura](https://github.com/IBM-Swift/Kitura) is a new, modular, package-based web framework written in the Swift language, that allows you to build web services with complex routes, easily.

## Kitura-Starter Overview
Kitura-Starter is a [Kitura](https://github.com/IBM-Swift/Kitura) based server application that you can use as a starting point to get your own Kitura application up and running on Bluemix. Also, if you'd like to run this app locally, you can do so on your [macOS](http://www.apple.com/osx/) or [Ubuntu 14.04](http://www.ubuntu.com/download) system.

## Application Requirements
To compile and run this starter application on your local system, you need to install the [Swift compiler](https://swift.org/download/) for your platform. This version of Kitura-Starter works with the Swift `3.0.1` release binaries. Compatibility with other Swift versions is not guaranteed.

For further details on executing Kitura-based applications locally, please see Kitura's instructions for installation on [macOS ](https://github.com/IBM-Swift/Kitura#installation-os-x) and on [Linux](https://github.com/IBM-Swift/Kitura#installation-linux-apt-based) since system level dependencies may be required before attempting to execute this starter app.

If you are interested in manually deploying the application to Bluemix, you'll need to install the Cloud Foundry [command line](https://docs.cloudfoundry.org/devguide/cf-cli/install-go-cli.html) on your system.  Once it is installed, you can use it to [authenticate and access](https://www.ng.bluemix.net/docs/starters/install_cli.html) your Bluemix organization(s) and spaces.  You can find further details on how to deploy this sample application to Bluemix in a subsequent section.

## Clone, build, and run locally
Once you have installed the Swift compiler and any system level dependencies required by the Kitura framework, you can proceed with the steps described in this section.

1) Clone this repo using `git clone https://github.com/IBM-Bluemix/Kitura-Starter.git`.

2) Go to the root folder of this repo on your system and issue the `swift build` command to compile the application:

```
$ swift build
Compile Swift Module 'Socket' (3 sources)
Compile Swift Module 'SwiftyJSON' (2 sources)
Compile Swift Module 'LoggerAPI' (1 sources)
Compile Swift Module 'KituraTemplateEngine' (1 sources)
Compile Swift Module 'HeliumLogger' (1 sources)
Compile Swift Module 'SSLService' (1 sources)
Compile Swift Module 'CloudFoundryEnv' (7 sources)
Compile CHTTPParser utils.c
Compile CHTTPParser http_parser.c
Linking CHTTPParser
Compile Swift Module 'KituraNet' (34 sources)
Compile Swift Module 'CloudFoundryDeploymentTracker' (1 sources)
Compile Swift Module 'Kitura' (41 sources)
Compile Swift Module 'Kitura_Starter' (2 sources)
Linking ./.build/debug/Kitura-Starter
```

Once the application is compiled, you can start the server (note that the executable file is located in the `.build/debug` directory: `./.build/debug/Kitura-Starter`):

```
$ ./.build/debug/Kitura-Starter
 INFO: Kitura_Starter main.swift line 29 - Server will be started on 'http://localhost:8090'. 
 INFO: listen(on:) HTTPServer.swift line 73 - Listening on port 8090 
```

Once the server starts, you should see the message _Listening on port 8090_ as shown above.

3) Open your browser at [http://localhost:8090](http://localhost:8090) to access the welcome page for the Kitura-Starter app. This page displays static HTML content served from the Kitura-based server application. You can explore the `public` folder in the repo to see the HTML file and related resources (e.g. images, CSS file)

4) To access a plain text greeting, point your browser to [http://localhost:8090/hello](http://localhost:8090/hello).

5) To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to [http://localhost:8090/hello](http://localhost:8090/hello). You should get a text response that includes the string you sent to the endpoint.

6) To receive a JSON payload, point your browser to [http://localhost:8090/json](http://localhost:8090/json).

## Pushing the application to Bluemix
### Using the Deploy to Bluemix button
Clicking on the button below deploys this starter application to Bluemix. The `manifest.yml` file [included in the repo] is parsed to obtain the name of the application and configuration details. For further details on the structure of the `manifest.yml` file, see the [Cloud Foundry documentation](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html#minimal-manifest).

<!---
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)
-->
[![Deploy to Bluemix](https://deployment-tracker.mybluemix.net/stats/f3517b364e8ee44775acaf9cece55f6c/button.svg)](https://bluemix.net/deploy?repository=https://github.com/IBM-Bluemix/Kitura-Starter.git)

Once deployment to Bluemix is completed, you can access the route assigned to your application using the web browser of your choice. You should then see the welcome page for the Kitura-Starter app! To access a plain text greeting, point your browser to `http://<application_route>/hello`. To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to `http://<application_route>/hello`. You should get a text response that includes the string you sent to the endpoint. Finally, to receive a JSON payload, point your browser to `http://<application_route>/json`.

Note that the [IBM Bluemix buildpack for Swift](https://github.com/IBM-Swift/swift-buildpack) is used for the deployment of this app to Bluemix. This IBM Bluemix buildpack for Swift is currently installed in the following Bluemix regions: US South, United Kingdom, and Sydney.

### Using the Cloud Foundry command line
You can also manually deploy the app to Bluemix. Though not as magical as using the Bluemix button above, manually deploying the app gives you some insights about what is happening behind the scenes. Remember that you'd need the Cloud Foundry [command line](https://www.ng.bluemix.net/docs/starters/install_cli.html) installed on your system to deploy the app to Bluemix.

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

Looking at the output above, we can see that the IBM Bluemix buildpack for Swift is installed on Bluemix. This will allow a seamless deployment of the starter application to Bluemix.

After you have cloned this Git repo, go to its root folder on your system and issue the `cf push` command:

```
$ cf push
Using manifest file /Users/olivieri/git/Kitura-Starter/manifest.yml

Creating app Kitura-Starter in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
OK

Creating route Kitura-Starter-unfiducial-flab.eu-gb.mybluemix.net...
OK

Binding Kitura-Starter-unfiducial-flab.eu-gb.mybluemix.net to Kitura-Starter...
OK

Uploading Kitura-Starter...
Uploading app files from: /Users/olivieri/git/Kitura-Starter
Uploading 110.4K, 60 files
Done uploading               
OK

Starting app Kitura-Starter in org roliv@us.ibm.com / space dev as roliv@us.ibm.com...
-----> Downloaded app package (56K)
-----> Default supported Swift version is 3.0
-----> Installing system level dependencies...
-----> Installing libblocksruntime0_0.1-1_amd64.deb
-----> Installing libblocksruntime-dev_0.1-1_amd64.deb
-----> Installing libcurl3_7.35.0-1ubuntu2.6_amd64.deb
-----> Installing libkqueue0_1.0.4-2ubuntu1_amd64.deb
-----> Installing libssl-dev_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing openssl_1.0.1f-1ubuntu2.19_amd64.deb
-----> Installing uuid-dev_2.20.1-5.1ubuntu20_amd64.deb
-----> No Aptfile found.
-----> Writing profile script...
-----> Installing Swift 3.0
-----> Buildpack version 2.0.0
       Downloaded Swift
-----> Installing Clang 3.8.0
       Downloaded Clang
-----> This buildpack does not add libdispatch binaries for swift-3.0 (note: Swift binaries from 8/23 and later already include libdispatch)
-----> Building Package...
       Cloning https://github.com/IBM-Swift/Kitura.git
       HEAD is now at 164f5df Merge branch 'master' into automatic_migration_to_1.0.0
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/Kitura-net.git
       HEAD is now at 34b6d06 updated dependency versions in Package.swift
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/LoggerAPI.git
       HEAD is now at d4c1682 Regenerated API Documentation (#15)
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/BlueSocket.git
       HEAD is now at 6fc0f37 Update to latest (3.0.1 BETA 1) toolchain.
       Resolved version: 0.11.11
       Cloning https://github.com/IBM-Swift/CCurl.git
       HEAD is now at 3330699 Removed use of pkgConfig and added system declaration
       Resolved version: 0.2.1
       Cloning https://github.com/IBM-Swift/CHTTPParser.git
       HEAD is now at 429eff6 Merge pull request #7 from ianpartridge/master
       Resolved version: 0.3.0
       Cloning https://github.com/IBM-Swift/BlueSSLService.git
       HEAD is now at 2d674f6 Update to latest (3.0.1 BETA 1) toolchain.
       Resolved version: 0.11.21
       Cloning https://github.com/IBM-Swift/OpenSSL.git
       Resolved version: 0.11.21
       Cloning https://github.com/IBM-Swift/OpenSSL.git
       HEAD is now at b5df08f Merge pull request #2 from preecet/master
       Resolved version: 0.2.2
       Cloning https://github.com/IBM-Swift/CEpoll.git
       HEAD is now at 111cbcb IBM-Swift/Kitura#435 Added a README.md file
       Cloning https://github.com/IBM-Swift/SwiftyJSON.git
       HEAD is now at 73b523a 3.0
       Resolved version: 14.2.0
       Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
       HEAD is now at f013da3 Regenerated API Documentation (#8)
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/HeliumLogger.git
       HEAD is now at 4a52f0b updated dependency versions in Package.swift
       Resolved version: 1.0.0
       Cloning https://github.com/IBM-Swift/Swift-cfenv.git
       HEAD is now at 04d7d88 Update swift version to 3.0
       Resolved version: 1.7.0
       Cloning https://github.com/IBM-Bluemix/cf-deployment-tracker-client-swift.git
       HEAD is now at ea2728c Updated Package.swift - References Kitura-net official release.
       Resolved version: 0.4.0
       Compile CHTTPParser http_parser.c
       Compile CHTTPParser utils.c
       Compile Swift Module 'Socket' (3 sources)
       Compile Swift Module 'LoggerAPI' (1 sources)
       Compile Swift Module 'SwiftyJSON' (2 sources)
       Compile Swift Module 'KituraTemplateEngine' (1 sources)
       Compile Swift Module 'HeliumLogger' (1 sources)
       Compile Swift Module 'SSLService' (1 sources)
       Compile Swift Module 'KituraNet' (29 sources)
       Compile Swift Module 'CloudFoundryEnv' (7 sources)
       Compile Swift Module 'CloudFoundryDeploymentTracker' (1 sources)
       Compile Swift Module 'Kitura' (40 sources)
       Compile Swift Module 'Kitura_Starter_Bluemix' (2 sources)
       Linking ./.build/release/Kitura-Starter
-----> Copying dynamic libraries
-----> Copying binaries to 'bin'
-----> Cleaning up build files
-----> Cleaning up cache folder

-----> Uploading droplet (17M)

1 of 1 instances running

App started


OK

App Kitura-Starter was started using this command `Kitura-Starter`
OK

requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: Kitura-Starter-unfiducial-flab.eu-gb.mybluemix.net
last uploaded: Sat Sep 24 00:11:48 UTC 2016
stack: cflinuxfs2
buildpack: swift_buildpack

     state     since                    cpu    memory          disk        details
#0   running   2016-09-23 08:14:40 PM   0.0%   18.9M of 256M   59M of 1G
```

Once the application is pushed to and running on Bluemix, you can access your application route to see the welcome page for the Kitura-Starter app. You can log on to your [Bluemix account](https://console.ng.bluemix.net) to find the route of your application or you can inspect the output from the execution of the `cf push` command.  The string value (e.g. Kitura-Starter-unfiducial-flab.eu-gb.mybluemix.net) shown next to the urls should contain the route.  Use that route as the URL to access the sample server using the browser of your choice.

## Kitura Wiki
Feel free to visit Kitura's [Wiki](https://github.com/IBM-Swift/Kitura/wiki) for our roadmap and tutorials.

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

    CloudFoundryDeploymentTracker(repositoryURL: "https://github.com/IBM-Bluemix/Kitura-Starter.git", codeVersion: nil).track()
    
## Running the application in an IBM Container on Bluemix
This starter application can also be run in an IBM Container in Bluemix. The `ibmcom/kitura-ubuntu` Docker image extends the [swift-ubuntu-docker](https://github.com/IBM-Swift/swift-ubuntu-docker) image. Hence, the `ibmcom/kitura-ubuntu` image also uses Ubuntu v14.04 LTS. For details on how to create an IBM Container to execute a Swift application, please see [10 Steps To Running a Swift App in an IBM Container] (https://developer.ibm.com/swift/2016/02/22/10-steps-to-running-a-swift-app-in-an-ibm-container) and [Running Kitura in an IBM Container](https://developer.ibm.com/swift/2016/03/04/running-kitura-in-an-ibm-container/).

## License
The Kitura-Starter sample app is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE).
