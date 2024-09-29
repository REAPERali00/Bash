dir="./scripts"
pattern="*.sh"

for file in "$dir"/$pattern; do
  echo "$file"
  chmod +x "$file"
done
