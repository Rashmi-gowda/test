#!/u01/app/oracle/apr2022/wls12cc/oracle_common/common/bin/wlst.sh
def wlDeployUndeploy(username, password, adminURL, appName, location, targets):
    try:
        #connect to admin server
        connect(username, password, adminURL)
        #start edit operation
        edit()
        startEdit()

        #stop application
        stopApplication(appName)

        #start undeploying application to "AdminServer" server
        progress = undeploy(appName, timeout=60000)
        progress.printStatus()
        save()
        activate(20000,block="true")
        #start deploying application to ""AdminServer" server
        progress = deploy(appName,location,targets)
        progress.printStatus()
        #print 'Done deploying application' +appname
#disconnect from Admin server
        disconnect()
        exit()
    except Exception, ex:
        print ex.toString()
        cancelEdit('y')

wlDeployUndeploy("weblogic3","weblogic03","t3://192.168.84.114:6001","benefits","/u01/app/oracle/apr2022/apps/benefits.war","AdminServer")


