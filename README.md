# aws-startup-scripts
Shell scripts to run on creation of aws server

### supervanitygen.sh
Installs [supervanitygen](https://github.com/klynastor/supervanitygen) and runs it until it finds a pattern match, and then saves it to the [friendpaste](https://friendpaste.com/) post. This script is useful for creating many servers to work together to find a match. Instances can die and be recreated automatically to continue working.

### neural.sh
This installs [torch](http://torch.ch/), [loadcaffe](https://github.com/szagoruyko/loadcaffe), [task-spooler](http://vicerveza.homeunix.net/~viric/soft/ts/), and [neural-style](https://github.com/jcjohnson/neural-style). This creates everything that is necessary to run neural-style. 