# Fake Company LTD Permission Description #

## People ##
* Alan the Auditor
* Danice the Developer
* Terry the Tester
* Rachel the Reporter
* Sam the Sysadmin

## db hosts ##
* report
* staging
* testing
* cert
* prod
* ops

## user groups ##
* Audit
* Development
* Testing
* Reporting
* Admin

## host groups ##
* all
* dev_stack - (all but report and ops)
* preprod (cert, staging, and testing)
* prod (prod)
* report (report, ops)

## permission types ##
* ALL
* Admin
* Read
* ReadWrite
* SchemaChanges
* ReadFile

## access table ##
* Audit - all - read
* Development - dev_stack - SchemaChanges
* Testing - dev_stack - ReadWrite
* Reporting - report - ReadFile
* Admin - All - all
