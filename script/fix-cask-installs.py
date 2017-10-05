#!/usr/local/env python

from subprocess import check_output
import sys
import os.path

debug = "--debug" in sys.argv
brewfiles = [x for x in sys.argv if x.endswith('.Brewfile')]

def log(msg):
    if debug:
        print msg

def app_exists(app):
    app_filename = check_output("brew cask info {0} | awk '/\(App\)/ {{ match($0, /.*\.app/); print substr($0, RSTART, RLENGTH); }}'".format(app), shell=True)
    app_file = "/Applications/{0}".format(app_filename.strip())
    log("checking for {0}".format(app_file))
    # apps are actually directories....
    return os.path.isdir(app_file)

def fix_casks(brewfile):
    log("fixing casks in {0}".format(brewfile))
    app_output = check_output("awk '/^cask / {{ gsub(/\"/, \"\", $2) ; print $2 }}' ~/{0}".format(brewfile), shell=True).strip()
    
    if app_output == '':
        log("brewfile '{0}' has no cask entries.".format(brewfile))
        return

    apps = app_output.split('\n')
    casks = check_output("brew cask ls -1", shell=True).strip().split('\n')

    log("checking {0} cask apps.".format(len(apps)))
    for app in apps:
        log("checking app '{0}'".format(app))
        if app == '':
            continue

        if app in casks:
            log("skipping properly casked app: {0}".format(app))
            continue

        log("checking {0}".format(app))
        if not app_exists(app):
            log("not installed, nothing to do")
            continue

        log("force installing: {0}".format(app))
        print check_output("brew cask install --force {0}".format(app), shell=True)
    log("--------")

# fix all the brewfiles!
for file in brewfiles: fix_casks(file)
