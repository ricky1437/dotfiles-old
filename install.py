import os
import shutil
import getpass

user_dir = {"nt": "C:/Users/" + getpass.getuser(), "posix": "~"}

files = {
    "glazewm": ".glzr",
    "wezterm": ".wezterm.lua",
    "lazygit": {
        "nt": "Appdata/Local/lazygit",
        "posix": ".config/lazygit",
    },
    "nvim": {"nt": "Appdata/Local/nvim", "posix": ".config/nvim"},
}


def removeOldTarget(destpath: str, isDir: bool):
    if isDir == True:
        shutil.rmtree(destpath)
    else:
        os.remove(destpath)


def installer(targetName: str, isOsSpecifiedPath: bool, isDir: bool):
    os_name = os.name
    file = files[targetName]
    if isOsSpecifiedPath == True:
        file = targetName
        destpath = os.path.join(user_dir[os_name], files[targetName][os_name])
    else:
        destpath = os.path.join(user_dir[os_name], files[targetName])

    print("installing", targetName, "configuration files...")
    if os.path.exists(destpath) == True:
        removeOldTarget(destpath, isDir)
    if isDir == True:
        shutil.copytree(file, destpath)
    else:
        shutil.copy(file, destpath)


def main():
    print("installation starts.")
    installer("glazewm", False, True)
    installer("wezterm", False, False)
    installer("nvim", True, True)
    installer("lazygit", True, True)
    print("installation finished")


main()
