import os
import shutil
import getpass

user_dir = {
        'nt': "C:/Users/" + getpass.getuser(),
        'posix': "/home/" + getpass.getuser()
        }

files = {
        'wezterm': '.wezterm.lua',
        'nvim': {
            'nt': 'Appdata/Local/nvim',
            'posix': '.config/nvim'
            }
        }

def checkWezExists(os_name):
    destpath = os.path.join(user_dir[os_name], files['wezterm'])
    if os.path.exists(destpath):
        os.remove(destpath)

def checkNvimExists(os_name):
    destpath = os.path.join(user_dir[os_name], files['nvim'][os_name])
    if os.path.exists(destpath):
        shutil.rmtree(destpath)

def install(os_name):
    checkWezExists(os_name)
    shutil.copy('.wezterm.lua', os.path.join(user_dir[os_name], files['wezterm']))
    checkNvimExists(os_name)
    shutil.copytree('nvim', os.path.join(user_dir[os_name], files['nvim'][os_name]))
    print('installation finished')


print("installation starts.")
install(os.name)
