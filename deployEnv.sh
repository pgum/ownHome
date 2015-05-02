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

#showInstructionsFor Configuration-of-Vim-editor
#installVundleVimPluginManager
#updateVundlePluginInformation

echoOk "Script finished"
