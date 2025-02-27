!#/bin/bash
git submodule foreach -q --recursive   'branch="$(git config -f $toplevel/.gitmodules submodule.$name.branch)"; git switch master'
