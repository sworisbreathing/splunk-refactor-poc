#!/bin/bash

SPLUNK_HOME=/app/splunk
splunkbin=$SPLUNK_HOME/bin/splunk
SPLUNK_APP_REPO=/app/git/splunk-deployment-apps
USER=splunk

SPLUNK_APP_DIR=$SPLUNK_HOME/etc/apps
SPLUNK_REPO_APPS_DIR=$SPLUNK_APP_REPO/apps

count_app_changes() {
  # get the number of changes between the git repository's non-deployment apps
  # and the apps currently installed into splunk.
  diff -q $SPLUNK_REPO_APPS_DIR $SPLUNK_APP_DIR \
    | grep -v gettingstarted \
    | grep -v launcher \
    | grep -v learned \
    | grep -v legacy \
    | grep -v sample_app \
    | grep -v search \
    | grep -v splunk_datapreview \
    | grep -v SplunkForwarder \
    | grep -v SplunkLightForwarder \
    | grep -v user-prefs \
    | grep -v framework \
    | grep -v introspection_generator_addon \
    | grep -v splunk_management_console \
    | grep -v "Common subdirectories" \
    | grep -Ev "\.git" \
    | wc -l
}

configure_deployment_server() {
  cp $SPLUNK_APP_REPO/serverclass.conf $SPLUNK_HOME/etc/system/local/serverclass.conf
}

reload_deployment_server() {
  su $USER -c "$splunkbin reload deploy-server -auth admin:splunk"
}

install_splunk_apps() {
  su $USER -c "cp -R $SPLUNK_REPO_APPS_DIR/* $SPLUNK_APP_DIR/"
}

restart_splunk() {
  service splunk restart
}


#######################################
# Real processing begins here
#######################################

RESTART_REQUIRED=$(count_app_changes)

# we always update the deployment server configuration.
configure_deployment_server

if [ $RESTART_REQUIRED -eq 0 ] ;then
  echo "reloading deployment server"
  reload_deployment_server
else
  echo "restarting splunk"
  install_splunk_apps
  restart_splunk
fi
