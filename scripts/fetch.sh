dirc="$HOME/Documents/"
for f in $(find $dirc -name ".git" -type d); do
  cd "$f"
  cd ..
  git pull
done
