# Hello ECS World!

## Folder tree:
```
main
│   README.md
│
└───app
    │   buildspec.yml : Configuration to use AWS cloudbuilder
    │   Containerfile : To setup a container for the app.
    │   go.mod        :
    │   go.sum        :
    │   README.md     :
    │
    ├───cmd
    │       conf_test.env : Temaplate file to configure the inviroment variables that'll be used to start the app.
    │       main.go       : Main app file.
    │
    └───mockdb
            mockdb.go : Implemantation of a very simple MySQL DB mock.
```