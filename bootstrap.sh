cp ~/dotfiles/.gitconfig ~/
cp ~/dotfiles/.zshrc ~/

# Only run nested steps in Spin workspaces.
if [[ "$SPIN" = 1 ]]
then
  # Only run nested steps in Spin + shopify/shopify workspaces.
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cartridge insert GoodForOneFare/returns-team-bootstrap
    . /cartridges/returns-team-bootstrap/setup.sh
  fi
fi
