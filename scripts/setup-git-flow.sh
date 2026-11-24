#!/bin/sh
# Initialize git flow and install the git-flow guard hooks in this workspace
# and in the submodules we develop in. Safe to re-run.
set -e
root=$(cd "$(dirname "$0")/.." && pwd)
hooks="$root/.githooks"
command -v git-flow >/dev/null 2>&1 || { echo "Install git-flow-next first: brew install git-flow-next" >&2; exit 1; }
chmod +x "$hooks"/*

setup() {  # $1 = repo dir, $2 = init flags
  dir=$1; shift
  git -C "$dir" config core.hooksPath "$hooks"
  for b in main develop; do
    git -C "$dir" show-ref -q --verify "refs/heads/$b" || \
      git -C "$dir" branch -q --track "$b" "origin/$b"
  done
  (cd "$dir" && git flow init --preset=classic --defaults "$@" --force >/dev/null)
  echo "git flow ready: $dir"
}

git -C "$root" submodule update --init --quiet
setup "$root" --shared
# Submodules where we do our own work (forks we develop in). Others are read-only references.
for sub in apple-neural-engine-training; do setup "$root/$sub" --local; done
