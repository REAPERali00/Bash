function basic() {
  clear
  java ./src/Main.java
}

function compile() {
  SRCDIR="./src/"
  BINDIR="./bin/"
  MAIN="Main"

  mkdir -p "$BINDIR"

  javac --release 17 -d "$BINDIR" $(find "$SRCDIR" -name "*.java")

  if [ ! $? -eq 0 ]; then
    echo "Could not compile program"
    exit 1
  fi

  echo "Running $MAIN..."
  java -cp "$BINDIR" "$MAIN"
}

compile
