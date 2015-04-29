#!/bin/bash
source deployEnv.helpers

showInstructionsFor What-will-be-configured

showInstructionsFor Config-files-file-structure
generateConfigsLinks

showInstructionsFor SSH-key-generation-linux-side
sshKeyGenerationProcedure

showInstructionsFor How-to-import-created-SSH-keys-into-PuTTY

showInstructionsFor Configuration-of-Vim-editor
installVundleVimPluginManager
updateVundlePluginInformation

echoOk "Script finished"
