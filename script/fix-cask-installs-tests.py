import unittest
from helpers import get_appname_for_cask

class TestFixCaskInstallsMethods(unittest.TestCase):

    def test_get_appname_chrome(self):
        appname = get_appname_for_cask('google-chrome')
        self.assertEqual(appname, 'Google Chrome.app')

    def test_get_appname_virtualbox(self):
        appname = get_appname_for_cask('virtualbox')
        self.assertEqual(appname, 'VirtualBox.app')

    def test_get_appname_java(self):
        appname = get_appname_for_cask('java')
        self.assertEqual(appname, '')

if __name__ == '__main__':
    unittest.main()
