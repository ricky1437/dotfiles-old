import os
import shutil
import getpass

user_dir = {
        'nt': "C:/Users/" + getpass.getuser(),
        'posix': "~"
        }

files = {
        'wezterm': '.wezterm.lua',
        'lazygit': {
            'nt': 'Appdata/Local/lazygit',
            'posix': '.config/lazygit',
            },
        'nvim': {
            'nt': 'Appdata/Local/nvim',
            'posix': '.config/nvim'
            }
        }

def checkWezExists(os_name):
    destpath = os.path.join(user_dir[os_name], files['wezterm'])
    if os.path.exists(destpath):
        os.remove(destpath)
        shutil.copy('.wezterm.lua', os.path.join(user_dir[os_name], files['wezterm']))


def checkNvimExists(os_name):
    destpath = os.path.join(user_dir[os_name], files['nvim'][os_name])
    if os.path.exists(destpath):
        shutil.rmtree(destpath)
        shutil.copytree('nvim', os.path.join(user_dir[os_name], files['nvim'][os_name]))

def checkLazyGitExists(os_name):
    destpath = os.path.join(user_dir[os_name], files['lazygit'][os_name])
    if os.path.exists(destpath):
        shutil.rmtree(destpath)
        shutil.copytree('lazygit', os.path.join(user_dir[os_name], files['lazygit'][os_name]))

def install(os_name):
    checkWezExists(os_name)
    checkNvimExists(os_name)
    checkLazyGitExists(os_name)
    print('installation finished')


print("installation starts.")
install(os.name)
