#!/bin/bash
scriptPath=$(dirname "$(readlink -f "$0")")
source $scriptPath/deployEnv.helpers

showInstructionsFor What-will-be-configured

showInstructionsFor Config-files-file-structure
generateConfigsLinks

if confirm "Do you want to generate SSH Keys? [y/N]"
  then
  showInstructionsFor SSH-key-generation-linux-side
  sshKeyGenerationProcedure

  showInstructionsFor How-to-import-created-SSH-keys-into-PuTTY
fi
if confirm "Do you want to download, install and configure vundle vim plugin manager? [y/N]"
  then
  showInstructionsFor Configuration-of-Vim-editor
  installVundleVimPluginManager
  updateVundlePluginInformation
fi
echoOk "Script finished"
