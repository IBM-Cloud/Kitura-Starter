![Kitura](https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Documentation/KituraLogo.png)

[![Build Status - Develop](https://travis-ci.org/IBM-Swift/Kitura-Starter-Bluemix.svg?branch=develop)](https://travis-ci.org/IBM-Swift/Kitura-Starter-Bluemix)
![macOS](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)
[![Join the chat at https://gitter.im/IBM-Swift/Kitura](https://badges.gitter.im/IBM-Swift/Kitura.svg)](https://gitter.im/IBM-Swift/Kitura?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![Bluemix Deployments](https://deployment-tracker.mybluemix.net/stats/c42412830c143a76568abe1fb2c0b3ea/badge.svg)

**Bluemix starter application for Kitura web framework and HTTP server**

## Summary
Kitura-Starter-Bluemix is a [Kitura](https://github.com/IBM-Swift/Kitura) based server application that you can use as a starting point to get your own Kitura application up and running on Bluemix. After cloning this GitHub repo to your local system, you can deploy this application to Bluemix right away. If you'd also like to run Kitura-Starter-Bluemix locally, then see the instructions for installation on [macOS ](https://github.com/IBM-Swift/Kitura#installation-os-x) or installation on [Linux](https://github.com/IBM-Swift/Kitura#installation-linux-apt-based) for details on system level dependencies you may need before attempting to execute this app.

## Swift version
This version of Kitura-Starter-Bluemix works with the Swift 3.0 RELEASE binaries. You can download this version of the Swift binaries by following this [link](https://swift.org/download/). Compatibility with other Swift versions is not guaranteed.

## Clone, build, and run
1. Clone this repo using `git clone https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git` and go to the root folder using `cd Kitura-Starter-Bluemix`. Please do not use the GitHub `Download ZIP` button as a way to clone this repo.

2. Compile and execute the server app using: `make run`. Once the server starts, you should see the message _Listening on port 8090_. The executable file is located in the `.build/debug` directory: `./.build/debug/Kitura-Starter-Bluemix`.

3. Open your browser at [http://localhost:8090](http://localhost:8090) to access the welcome page for the Kitura-Starter-Bluemix app. This page displays static HTML content served from the Kitura-based server. Explore the `public` folder to see the HTML file and resources in it.

4. To access a plain text greeting, point your browser to: [http://localhost:8090/hello](http://localhost:8090/hello).

5. To perform a `POST` operation, use your preferred REST client (e.g. [Postman](https://www.getpostman.com/)) to send a string to the following endpoint: [http://localhost:8090/hello](http://localhost:8090/hello). You should get a text response that includes the string you sent to the endpoint.

## Pushing the application to Bluemix
### Using the Deploy to Bluemix button
Clicking on the button below deploys this sample application to Bluemix. The `manifest.yml` file [included in the repo] is parsed to obtain the name of the application and configuration details. For further details on the structure of the `manifest.yml` file, see the [Cloud Foundry documentation](https://docs.cloudfoundry.org/devguide/deploy-apps/manifest.html#minimal-manifest).

<!---
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)
-->
[![Deploy to Bluemix](https://deployment-tracker.mybluemix.net/stats/c42412830c143a76568abe1fb2c0b3ea/button.svg)](https://bluemix.net/deploy?repository=https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git)

Once deployment to Bluemix is completed, you should access the route assigned to your application using the web browser of your choice. You should see the Kitura welcome page!

Note that the [IBM Bluemix buildpack for Swift](https://github.com/IBM-Swift/swift-buildpack) is used for the deployment of this app to Bluemix. This IBM Bluemix buildpack for Swift is currently installed in the following Bluemix regions: US South, United Kingdom, and Sydney.

### Using the Cloud Foundry command line
You should have the Cloud Foundry command line installed on your system and you should be already logged on to Bluemix before you attempt the following steps.

1. From the root folder of this repo on your local system, execute `cf push`.

2. Once the application is pushed to and running on Bluemix, you can access your application route to see Kitura's welcome page on your browser.

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
