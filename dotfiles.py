#!/usr/bin/env python3
import argparse
import os

DOTFILE_MAPPING = {
    "nvim-init.vim": "~/.config/nvim/init.vim",
    "bash_profile.sh": "~/.bash_profile",
    "tmux.conf": "~/.tmux.conf",
    "priv/homebrew_github_api_token.sh": "~/.homebrew_github_api_token.sh"
} 

def setup():
    print("Starting setup")
    for file_from, file_to in DOTFILE_MAPPING.items():
        print("Symlinking {} <- {}".format(file_to, file_from))
        os.system('ln {} {}'.format(file_from, file_to))
    print("Finished setup")
    
def teardown():
    print("Starting teardown")
    for file_to in DOTFILE_MAPPING.values():
        print("Removing {}".format(file_to))
        os.system('rm {}'.format(file_to))
    print("Finished teardown")

cmds = {
    "setup": setup,
    "teardown": teardown
}

def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(help='Available subcommands', dest='cmd')
    subparsers.required = True
    subparsers.add_parser('setup', help='setup by linking dotfiles')
    subparsers.add_parser('teardown', help='teardown by removing linked dotfiles')
    args = parser.parse_args()
    cmds[args.cmd]()

if __name__ == '__main__':
    main()

