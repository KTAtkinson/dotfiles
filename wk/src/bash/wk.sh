#!/bin/bash
set -e
source $HOME/.wk.config

WK_ACTION=$1;
shift;

NAME=$1;
shift;

case $WK_ACTION in
  create)
    for DIR in "$@"
    do
      git -C $GIT_WORK_DIR/$DIR worktree add -b $NAME $WORKSPACE_DIR/$NAME/$DIR $BRANCH_FROM
    done;
    ;;

  add-repo)
    REMOTE=$1
    git clone --separate-git-dir $GIT_WORK_DIR/$NAME -o reddit $REMOTE $CODE_DIR/$NAME
    ;;
  
  reset-master)
    for REPO in "$@"
    do
      CODE_PATH=$CODE_DIR/$REPO
      if [ "$(git -C $CODE_PATH rev-parse --abbrev-ref HEAD)" != "master" ]; then
        git -C $CODE_PATH checkout master
      fi

      git -C $CODE_PATH reset --hard reddit/master
      git add *
      git commit --amend -m "PLACEHOLDER"
      git -C $CODE_PATH reset --hard $NAME
    done;
    ;;   

  delete)
    if [ -z "$1" ]; then
      echo "Removing all"
      REMOVE=$(ls $WORKSPACE_DIR/$NAME)
    else
      echo "Removing $@"
      REMOVE=$@
    fi

    for r in $REMOVE
    do
      rm -rf $WORKSPACE_DIR/$NAME/$r
      git -C $GIT_WORK_DIR/$r/ branch -d $NAME
      git -C $GIT_WORK_DIR/$r/ worktree prune
    done;

    if [ -z "$(ls $WORKSPACE_DIR/$NAME)" ]; then
      rmdir $WORKSPACE_DIR/$NAME
    fi
    ;;

  *)
    echo "$WK_ACTION no such action."
    exit 1
    ;;
esac
