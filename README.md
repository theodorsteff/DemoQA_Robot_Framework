# DemoQA Robot Framework
## RobotFramework with Python integration

**Demo Project:** *Robot testing framework implementation with Python*  
**Dependency packages installed:** **_robotframework_, _robotframework-seleniumlibrary_ and _pyyaml_** *(including their automatically installed dependencies)*  
**Credits:** *The demo page used is provided by AutomationExercise (https://automationexercise.com/)*

In order to install the required packages, please follow the *pip install* command structure, as showcased below.

### robotframework
`» pip install robotframework`

### robotframework-seleniumlibrary
`» pip install --upgrade robotframework-seleniumlibrary`

### pyyaml
`» pip install pyyaml`  

For test suite execution, change the folder path to the base folder of the project and use the robotframework syntax, as shown below.

### Running the test suite:
`» cd <DemoQA_Robot_Framework>`  
`» python -m robot -d Results/$(date "+%Y.%m.%d-%H.%M.%S") Tests/OnlineShopping.robot`  
  
**Python version used:** *Python 3.11.0*  
**RobotFramework version used:** *robotframework 7.2.2*  
**RobotFramework-pythonlibcore version used:** *robotframework-pythonlibcore 4.4.1*  
**RobotFramework-seleniumlibrary version used:** *robotframework-seleniumlibrary 6.7.0*  
**Python version used:** *PyYAML 6.0.2*  
