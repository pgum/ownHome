#!/bin/bash
scriptPath=$(dirname "$(readlink -f "$0")")
source $scriptPath/scripts/deployEnv.helpers

showInstructionsFor What-will-be-configured

showInstructionsFor Config-files-file-structure
generateConfigsLinks
showInstructionsFor SSH-key-generation-linux-side
if confirm "Do you want to generate SSH Keys? [y/N]"
  then
  sshKeyGenerationProcedure
  showInstructionsFor How-to-import-created-SSH-keys-into-PuTTY
fi
showInstructionsFor Configuration-of-Vim-editor
if confirm "Do you want to download, install and configure vundle vim plugin manager? [y/N]"
  then
  installVundleVimPluginManager
  updateVundlePluginInformation
fi
echoOk "Script finished"
