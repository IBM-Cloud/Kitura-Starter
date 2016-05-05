![Kitura](https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Documentation/KituraLogo.png)

![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)
[![Join the chat at https://gitter.im/IBM-Swift/Kitura](https://badges.gitter.im/IBM-Swift/Kitura.svg)](https://gitter.im/IBM-Swift/Kitura?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

**Bluemix starter application for Kitura web framework**

## Summary
Kitura-Starter-Bluemix is a [Kitura](https://github.com/IBM-Swift/Kitura) based server application that you can use as a starting point to get your own Kitura application up and running on Bluemix. After cloning this GitHun repo to your local syste, you can deploy this application to Bluemix right away. If you'd also like to run Kitura-Starter-Bluemix locally, then see the instructions for installation on [OS X ](https://github.com/IBM-Swift/Kitura#installation-os-x) or installation on [Linux](https://github.com/IBM-Swift/Kitura#installation-linux-apt-based) for details on system level dependencies you may need before attempting to execute this app.

## Clone, build and run
1. `git clone https://github.com/IBM-Swift/Kitura-Starter-Bluemix.git && cd Kitura-Starter-Bluemix`
> Note: do not use the GitHub "Download ZIP" button

2. `make run`

  You should see message _Listening on port 8090_. The result executable is located in `.build/debug` directory: `./.build/debug/Kitura-Starter-Bluemix`

3. Open your browser at [http://localhost:8090](http://localhost:8090)

4. Access static content using the following URL:[http://localhost:8090/static](http://localhost:8090/static)

## Pushing to Bluemix
1. `cf push`
> Note: You will need to be logged in to the Cloud Foundry CLI.

2. Access your application route.

## Kitura Wiki
Feel free to visit our [Wiki](https://github.com/IBM-Swift/Kitura/wiki) for our roadmap and some tutorials.

## License
Kitura-Starter-Bluemix app is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).
