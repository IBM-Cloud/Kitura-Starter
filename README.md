![Kitura](https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Documentation/KituraLogo.png)

[![Build Status - Master](https://travis-ci.org/IBM-Cloud/Kitura-Starter.svg?branch=master)](https://travis-ci.org/IBM-Cloud/Kitura-Starter)
[![Join the chat at https://gitter.im/IBM-Swift/Kitura](https://badges.gitter.im/IBM-Swift/Kitura.svg)](https://gitter.im/IBM-Swift/Kitura?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![macOS](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)](http://www.apple.com/macos/)
[![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)](http://releases.ubuntu.com/18.04/)
[![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0)

**IBM Cloud starter application for Kitura web framework and HTTP server**

## What is Kitura?
[Kitura](https://github.com/IBM-Swift/Kitura) is a new, modular, package-based web framework written in the Swift language, that allows you to build web services with complex routes, easily.

## Kitura-Starter Overview
Kitura-Starter is a [Kitura](https://github.com/IBM-Swift/Kitura) based server application that you can use as a starting point to get your own Kitura application up and running on the IBM Cloud. Also, if you'd like to run this app locally, you can do so on your [macOS](http://www.apple.com/osx/) or [Ubuntu 18.04](http://www.ubuntu.com/download) system.

## Application Requirements
To compile and run this starter application on your local system, you need to install the [Swift compiler](https://swift.org/download/) for your platform. This version of Kitura-Starter works with the Swift `5.0+` release binaries. Compatibility with other Swift versions is not guaranteed.

For further details on executing Kitura-based applications locally, please see Kitura's instructions for installation on [macOS ](https://github.com/IBM-Swift/Kitura#installation-os-x) and on [Linux](https://github.com/IBM-Swift/Kitura#installation-linux-apt-based) since system level dependencies may be required before attempting to execute this starter app.

If you are interested in manually deploying the application to the IBM Cloud, you'll need to install the IBM Cloud [command line](https://cloud.ibm.com/docs/cli/index.html) on your system.  Once it is installed, you can use it to [authenticate and access](https://cloud.ibm.com/docs/cli/index.html#step3) your IBM Cloud organization(s) and spaces. You can find further details on how to deploy this sample application to the IBM Cloud in a subsequent section.

## Clone, build, and run locally
Once you have installed the Swift compiler and any system level dependencies required by the Kitura framework, you can proceed with the steps described in this section.

1) Clone this repo using `git clone https://github.com/IBM-Cloud/Kitura-Starter.git`.

2) Go to the root folder of this repo on your system and issue the `swift build` command to compile the application:

```
$ swift build
Fetching https://github.com/IBM-Swift/FileKit.git
Fetching https://github.com/IBM-Swift/Kitura-net.git
Fetching https://github.com/IBM-Swift/Kitura-TemplateEngine.git
Fetching https://github.com/IBM-Swift/BlueSocket.git
Fetching https://github.com/apple/swift-log.git
Fetching https://github.com/IBM-Swift/TypeDecoder.git
Fetching https://github.com/IBM-Swift/BlueSignals.git
Fetching https://github.com/IBM-Swift/Swift-cfenv.git
Fetching https://github.com/IBM-Swift/Health.git
Fetching https://github.com/IBM-Swift/OpenSSL.git
Fetching https://github.com/IBM-Swift/KituraContracts.git
Fetching https://github.com/IBM-Swift/BlueSSLService.git
Fetching https://github.com/IBM-Swift/Kitura.git
Fetching https://github.com/IBM-Swift/LoggerAPI.git
Fetching https://github.com/IBM-Swift/CloudEnvironment.git
Fetching https://github.com/IBM-Swift/Configuration.git
Fetching https://github.com/IBM-Swift/HeliumLogger.git
Completed resolution in 41.89s
Cloning https://github.com/IBM-Swift/LoggerAPI.git
Resolving https://github.com/IBM-Swift/LoggerAPI.git at 1.9.0
Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
Resolving https://github.com/IBM-Swift/Kitura-TemplateEngine.git at 2.0.1
Cloning https://github.com/IBM-Swift/KituraContracts.git
Resolving https://github.com/IBM-Swift/KituraContracts.git at 1.1.3
Cloning https://github.com/IBM-Swift/Health.git
Resolving https://github.com/IBM-Swift/Health.git at 1.0.5
Cloning https://github.com/IBM-Swift/TypeDecoder.git
Resolving https://github.com/IBM-Swift/TypeDecoder.git at 1.3.3
Cloning https://github.com/IBM-Swift/Swift-cfenv.git
Resolving https://github.com/IBM-Swift/Swift-cfenv.git at 6.0.3
Cloning https://github.com/IBM-Swift/BlueSSLService.git
Resolving https://github.com/IBM-Swift/BlueSSLService.git at 1.0.48
Cloning https://github.com/IBM-Swift/BlueSocket.git
Resolving https://github.com/IBM-Swift/BlueSocket.git at 1.0.48
Cloning https://github.com/IBM-Swift/Configuration.git
Resolving https://github.com/IBM-Swift/Configuration.git at 3.0.4
Cloning https://github.com/IBM-Swift/FileKit.git
Resolving https://github.com/IBM-Swift/FileKit.git at 0.0.2
Cloning https://github.com/IBM-Swift/Kitura-net.git
Resolving https://github.com/IBM-Swift/Kitura-net.git at 2.3.0
Cloning https://github.com/IBM-Swift/Kitura.git
Resolving https://github.com/IBM-Swift/Kitura.git at 2.8.0
Cloning https://github.com/IBM-Swift/CloudEnvironment.git
Resolving https://github.com/IBM-Swift/CloudEnvironment.git at 9.1.0
Cloning https://github.com/IBM-Swift/HeliumLogger.git
Resolving https://github.com/IBM-Swift/HeliumLogger.git at 1.9.0
Cloning https://github.com/apple/swift-log.git
Resolving https://github.com/apple/swift-log.git at 1.1.0
[169/169] Linking Kitura-Starter
```

Once the application is compiled, you can start the server (note that the executable file is located in the `.build/debug` directory: `./.build/debug/Kitura-Starter`):

```
$ ./.build/debug/Kitura-Starter
 INFO: Kitura_Starter main.swift line 29 - Server will be started on 'http://localhost:8080'.
 INFO: listen(on:) HTTPServer.swift line 73 - Listening on port 8080
```

Once the server starts, you should see the message _Listening on port 8080_ as shown above.

3) Open your browser at [http://localhost:8080](http://localhost:8080) to access the welcome page for the Kitura-Starter app. This page displays static HTML content served from the Kitura-based server application. You can explore the `public` folder in the repo to see the HTML file and related resources (e.g. images, CSS file)

4) To access a plain text greeting, point your browser to [http://localhost:8080/hello](http://localhost:8080/hello).

5) To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to [http://localhost:8080/hello](http://localhost:8080/hello). You should get a text response that includes the string you sent to the endpoint.

6) To receive a JSON payload, point your browser to [http://localhost:8080/json](http://localhost:8080/json).

7) To receive a JSON payload that states the health of the application, point your browser to [http://localhost:8080/health](http://localhost:8080/health).

## Pushing the application to IBM Cloud
### Using the Deploy to IBM Cloud button
Clicking on the button below deploys this starter application to the IBM Cloud. The `manifest.yml` file [included in the repo] is parsed to obtain the name of the application and configuration details. For further details on the structure of the `manifest.yml` file, see the [Cloud Foundry documentation](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html#minimal-manifest).

[![Deploy to IBM Cloud](https://cloud.ibm.com/devops/setup/deploy/button.png)](https://cloud.ibm.com/devops/setup/deploy?repository=https://github.com/IBM-Cloud/Kitura-Starter.git)

Once deployment to the IBM Cloud is completed, you can access the route assigned to your application using the web browser of your choice. You should then see the welcome page for the Kitura-Starter app! To access a plain text greeting, point your browser to `http://<application_route>/hello`. To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to `http://<application_route>/hello`. You should get a text response that includes the string you sent to the endpoint. Finally, to receive a JSON payload, point your browser to `http://<application_route>/json`.

Note that the [IBM Cloud buildpack for Swift](https://github.com/IBM-Swift/swift-buildpack) is used for the deployment of this app to the IBM Cloud. This IBM Cloud buildpack for Swift is currently installed in the following IBM Cloud regions: US South, United Kingdom, and Sydney.

### Using the IBM Cloud command line
You can also manually deploy the app to the IBM Cloud. Though not as magical as using the IBM Cloud button above, manually deploying the app gives you some insights about what is happening behind the scenes. Remember that you'd need the IBM Cloud [command line](https://cloud.ibm.com/docs/cli/index.html) installed on your system to deploy the app to the IBM Cloud.

Using the IBM Cloud command line you can get a list of the buildpacks (along with their versions) that are installed on the IBM Cloud. Note that you should be already logged on to the IBM Cloud before you issue any of the following commands.

Executing the `ibmcloud cf buildpacks` above command should result in output similar to the following:

```
$ ibmcloud cf buildpacks
Invoking 'cf buildpacks'...

Getting buildpacks...

buildpack                                         position   enabled   locked   filename                                               stack
liberty-for-java                                  1          true      false    buildpack_liberty-for-java_v3.36-20190905-1704.zip
sdk-for-nodejs                                    2          true      false    buildpack_sdk-for-nodejs_v4.0-20190912-1615.zip
dotnet-core                                       3          true      false    buildpack_dotnet-core_v2.4-20190912-1554.zip
swift_buildpack                                   4          true      false    buildpack_swift_v2.1.1-20190821-1903.zip
noop-buildpack                                    5          true      false    noop-buildpack-20140311-1519.zip
xpages_buildpack                                  6          true      false    xpages_buildpack_v1.2.2-20170112-1328.zip
liberty-for-java_v3_17_1-20180131-1532            7          true      false    buildpack_liberty-for-java_v3.17.1-20180131-1532.zip
liberty_v3_14-20171013-1023                       8          true      false    buildpack_liberty_v3.14-20171013-1023.zip
swift_buildpack_v2_0_18-20190303-1915             9          true      false    buildpack_swift_v2.0.18-20190303-1915.zip
swift_buildpack_v2_0_20-20190401-2122             10         true      false    buildpack_swift_v2.0.20-20190401-2122.zip
staticfile_buildpack                              11         true      false    staticfile-buildpack-cflinuxfs3-v1.4.35.zip            cflinuxfs3
java_buildpack                                    12         true      false    java-buildpack-cflinuxfs3-v4.16.1.zip                  cflinuxfs3
ruby_buildpack                                    13         true      false    ruby-buildpack-cflinuxfs3-v1.7.27.zip                  cflinuxfs3
nodejs_buildpack                                  14         true      false    nodejs-buildpack-cflinuxfs3-v1.6.34.zip                cflinuxfs3
go_buildpack                                      15         true      false    go-buildpack-cflinuxfs3-v1.8.29.zip                    cflinuxfs3
python_buildpack                                  16         true      false    python-buildpack-cflinuxfs3-v1.6.23.zip                cflinuxfs3
php_buildpack                                     17         true      false    php-buildpack-cflinuxfs3-v4.3.64.zip                   cflinuxfs3
binary_buildpack                                  18         true      false    binary-buildpack-cflinuxfs3-v1.0.27.zip                cflinuxfs3
swift_buildpack_cflinuxfs3_v2_1_0-20190404-1206   19         true      false    buildpack_swift_cflinuxfs3_v2.1.0-20190404-1206.zip    cflinuxfs3
liberty-for-java_v3_35-20190813-1755              20         true      false    buildpack_liberty-for-java_v3.35-20190813-1755.zip
liberty-for-java_v3_36-20190905-1704              21         true      false    buildpack_liberty-for-java_v3.36-20190905-1704.zip
dotnet-core_v2_3-20190609-2145                    22         true      false    buildpack_dotnet-core_v2.3-20190609-2145.zip
dotnet-core_v2_4-20190912-1554                    23         true      false    buildpack_dotnet-core_v2.4-20190912-1554.zip
sdk-for-nodejs_v3_28-20190722-1336                24         true      false    buildpack_sdk-for-nodejs_v3.28-20190722-1336.zip
sdk-for-nodejs_v4_0-20190912-1615                 25         true      false    buildpack_sdk-for-nodejs_v4.0-20190912-1615.zip
```

Looking at the output above, we can see that the Swift buildpack is installed on the IBM Cloud. This will allow a seamless deployment of the starter application to the IBM Cloud.

After you have cloned this Git repo, go to its root folder on your system and issue the `ibmcloud app push` command. Here is some sample output from the Swift buildpack (v2.2.0) running Swift 5.1:

```
$ ibmcloud app push
...
Using manifest file /Users/gvalenc/git/DevX/Kitura-Starter/manifest.yml
Getting app info...
Creating app with these attributes...
+ name:         kitura-starter-swift51
  path:         /Users/gvalenc/git/DevX/Kitura-Starter
  buildpacks:
+   https://github.com/IBM-Swift/swift-buildpack
+ command:      Kitura-Starter
+ disk quota:   1G
+ instances:    1
+ memory:       256M
  routes:
+   kitura-starter-swift51-turbulent-buffalo.mybluemix.net

Creating app kitura-starter-swift51...
Mapping routes...
Comparing local files to remote cache...
Packaging files to upload...
Uploading files...
 30.50 KiB / 30.50 KiB [==================================================================================] 100.00% 1s

Waiting for API to complete processing files...

Staging app and tracing logs...
   Cell 4506b303-dccf-48d5-9f39-7c6ac85ff0da creating container for instance 0dc09158-a961-42cc-acef-77853eed9182
   Cell 4506b303-dccf-48d5-9f39-7c6ac85ff0da successfully created container for instance 0dc09158-a961-42cc-acef-77853eed9182
   Downloading app package...
   Downloaded app package (30.5K)
   -----> Buildpack version 2.2.0
   -----> Default supported Swift version is 5.1
   -----> Configure for apt-get installs...
   -----> Writing profile script...
   -----> Copying deb files to installation folder...
   -----> No Aptfile found.
   -----> Getting swift-5.1
          Downloaded swift-5.1
   -----> Unpacking swift-5.1.tar.gz
   -----> Getting clang-8.0.0
          Downloaded clang-8.0.0
   -----> Unpacking clang-8.0.0.tar.xz
   -----> .ssh directory and config file not found.
   -----> Skipping cache restore (new swift signature)
   -----> Fetching Swift packages and parsing Package.swift files...
          Fetching https://github.com/apple/swift-log.git
          Fetching https://github.com/IBM-Swift/BlueSignals.git
          Fetching https://github.com/IBM-Swift/Kitura.git
          Fetching https://github.com/IBM-Swift/Swift-cfenv.git
          Fetching https://github.com/IBM-Swift/OpenSSL.git
          Fetching https://github.com/IBM-Swift/KituraContracts.git
          Fetching https://github.com/IBM-Swift/BlueSSLService.git
          Fetching https://github.com/IBM-Swift/BlueSocket.git
          Fetching https://github.com/IBM-Swift/CloudEnvironment.git
          Fetching https://github.com/IBM-Swift/Kitura-net.git
          Fetching https://github.com/IBM-Swift/HeliumLogger.git
          Fetching https://github.com/IBM-Swift/LoggerAPI.git
          Fetching https://github.com/IBM-Swift/FileKit.git
          Fetching https://github.com/IBM-Swift/Kitura-TemplateEngine.git
          Fetching https://github.com/IBM-Swift/Configuration.git
          Fetching https://github.com/IBM-Swift/TypeDecoder.git
          Fetching https://github.com/IBM-Swift/Health.git
   Completed resolution in 19.04s
          Cloning https://github.com/IBM-Swift/LoggerAPI.git
          Resolving https://github.com/IBM-Swift/LoggerAPI.git at 1.9.0
          Cloning https://github.com/IBM-Swift/OpenSSL.git
          Resolving https://github.com/IBM-Swift/OpenSSL.git at 2.2.2
          Cloning https://github.com/IBM-Swift/BlueSSLService.git
          Resolving https://github.com/IBM-Swift/BlueSSLService.git at 1.0.48
          Cloning https://github.com/IBM-Swift/TypeDecoder.git
          Resolving https://github.com/IBM-Swift/TypeDecoder.git at 1.3.3
          Cloning https://github.com/IBM-Swift/CloudEnvironment.git
          Resolving https://github.com/IBM-Swift/CloudEnvironment.git at 9.1.0
          Cloning https://github.com/IBM-Swift/BlueSignals.git
          Resolving https://github.com/IBM-Swift/BlueSignals.git at 1.0.20
          Cloning https://github.com/IBM-Swift/FileKit.git
          Resolving https://github.com/IBM-Swift/FileKit.git at 0.0.2
          Cloning https://github.com/IBM-Swift/BlueSocket.git
          Resolving https://github.com/IBM-Swift/BlueSocket.git at 1.0.48
          Cloning https://github.com/IBM-Swift/KituraContracts.git
          Resolving https://github.com/IBM-Swift/KituraContracts.git at 1.1.3
          Cloning https://github.com/apple/swift-log.git
          Resolving https://github.com/apple/swift-log.git at 1.1.0
          Cloning https://github.com/IBM-Swift/Configuration.git
          Resolving https://github.com/IBM-Swift/Configuration.git at 3.0.4
          Cloning https://github.com/IBM-Swift/Swift-cfenv.git
          Resolving https://github.com/IBM-Swift/Swift-cfenv.git at 6.0.3
          Cloning https://github.com/IBM-Swift/Kitura-net.git
          Resolving https://github.com/IBM-Swift/Kitura-net.git at 2.3.0
          Cloning https://github.com/IBM-Swift/Health.git
          Resolving https://github.com/IBM-Swift/Health.git at 1.0.5
          Cloning https://github.com/IBM-Swift/HeliumLogger.git
          Resolving https://github.com/IBM-Swift/HeliumLogger.git at 1.9.0
          Cloning https://github.com/IBM-Swift/Kitura.git
          Resolving https://github.com/IBM-Swift/Kitura.git at 2.8.1
          Cloning https://github.com/IBM-Swift/Kitura-TemplateEngine.git
          Resolving https://github.com/IBM-Swift/Kitura-TemplateEngine.git at 2.0.1
   -----> No additional packages to download.
   -----> Skipping installation of App Management (debug)
   -----> Installing system level dependencies...
   -----> Building Package...
   -----> Build config: release
          [1/7] Compiling Signals Signals.swift
          [2/8] Compiling KituraTemplateEngine TemplateEngine.swift
          [3/8] Compiling CHTTPParser utils.c
          [4/8] Compiling CHTTPParser http_parser.c
          [5/8] Compiling Logging Locks.swift
          [6/9] Compiling LoggerAPI Logger.swift
          [7/11] Compiling TypeDecoder OrderedDictionary.swift
          [8/12] Compiling HeliumLogger HeliumLogHandler.swift
          [9/12] Compiling Socket Socket.swift
          [10/13] Compiling Health Health.swift
          [11/14] Compiling FileKit FileKit.swift
          [12/15] Compiling SSLService SSLPointerTricks.swift
          [13/16] Compiling Configuration ConfigurationManager.swift
          [14/17] Compiling CloudFoundryEnv App.swift
          [15/18] Compiling CloudEnvironment AlertNotificationCredentials.swift
          [16/18] Compiling KituraContracts BodyDecoder.swift
          [17/18] Compiling KituraNet BufferList.swift
          [18/19] Compiling Kitura AdditionalCookieAttribute.swift
          [19/20] Compiling Controller Controller.swift
          [20/21] Compiling Kitura-Starter main.swift
          [21/21] Linking Kitura-Starter
   -----> Bin path: /tmp/app/.build/x86_64-unknown-linux/release
   -----> Copying dynamic libraries
   -----> Copying binaries to 'bin'
   -----> Clearing previous swift cache
   -----> Skipping cache save (disabled by default)
   -----> Optimizing contents of cache folder...
   No start command specified by buildpack or via Procfile.
   App will not start unless a command is provided at runtime.
   Exit status 0
   Uploading droplet, build artifacts cache...
   Uploading droplet...
   Uploading build artifacts cache...
   Uploaded build artifacts cache (2K)
   Uploaded droplet (259.5M)
   Uploading complete
   Cell 4506b303-dccf-48d5-9f39-7c6ac85ff0da stopping instance 0dc09158-a961-42cc-acef-77853eed9182
   Cell 4506b303-dccf-48d5-9f39-7c6ac85ff0da destroying container for instance 0dc09158-a961-42cc-acef-77853eed9182

Waiting for app to start...

name:              kitura-starter-swift51
requested state:   started
routes:            kitura-starter-swift51-turbulent-buffalo.mybluemix.net
last uploaded:     Thu 26 Sep 10:52:49 CDT 2019
stack:             cflinuxfs3
buildpacks:        https://github.com/IBM-Swift/swift-buildpack

type:            web
instances:       1/1
memory usage:    256M
start command:   Kitura-Starter
     state     since                  cpu    memory        disk           details
#0   running   2019-09-26T15:53:33Z   1.9%   36K of 256M   194.5M of 1G
```

Once the application is pushed to and running on the IBM Cloud, you can access your application route to see the welcome page for the Kitura-Starter app. You can log on to your [IBM Cloud account](https://cloud.ibm.com) to find the route of your application or you can inspect the output from the execution of the `ibmcloud app push` command.  The string value (e.g. Kitura-Starter-unfiducial-flab.eu-gb.mybluemix.net) shown next to the urls should contain the route.  Use that route as the URL to access the sample server using the browser of your choice.

## Kitura.io
Feel free to visit [Kitura.io](http://www.kitura.io/) for our roadmap and tutorials.

## License
The Kitura-Starter sample app is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE).
