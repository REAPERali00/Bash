name="Ali"

if [[ $name -eq "Ali" ]]; then
  echo $name
fi

echo -n "How old are you?"
read age

if [[ age -ge 12 ]]; then
  echo "you can buy a ticket for the movie!"
fi

for i in {1..5}; do
  echo "welcome bish number $i"
done

for ((c = 1; c < 3; c++)); do
  echo "by bish $c"
done
for arg in $@; do
  echo "you sayed $arg"
done
