#!/bin/bash

mkdir ~/Repo
cd ~/Repo

git clone git@github.com:BrokenDraft/my_logseq_vault-v1.git
git clone ssh://git@codeberg.org/brokendraft/brokendraft-lab-ansible.git
git clone ssh://git@codeberg.org/brokendraft/brokendraft-blog.git
git clone ssh://git@codeberg.org/brokendraft/my-weird-dashboard.git
git clone ssh://git@codeberg.org/brokendraft/brokendraft-lab-terraform.git
git clone git@github.com:BrokenDraft/learning-odin.git
git clone git@github.com:BrokenDraft/brokynvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone git@github.com:BrokenDraft/dev-kickstart.git
git clone git@github.com:BrokenDraft/screeps-templates.git
