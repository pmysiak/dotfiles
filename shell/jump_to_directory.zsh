#!/usr/bin/zsh

local -A JUMP_TO_DIRECTORIES_LIST=(
	["do"]="~/downloads"
	[pr]="~/projects"
	[di]="~/projects/diggysadventure"
  [xe]="~/projects/xml-editor-tool"
  [we]="~/projects/world-editor-tool"
  [de]="~/projects/definitions"
  [co]="~/projects/content"
  [me]="~/projects/metis"
  [mb]="~/projects/metis-bundle"
)

jump_to_directory() {
	if [[ -v JUMP_TO_DIRECTORIES_LIST[$1] ]]; then
		cd "${JUMP_TO_DIRECTORIES_LIST[$1]//\~/$HOME}"

		return
	fi

	cd "$@"
}

