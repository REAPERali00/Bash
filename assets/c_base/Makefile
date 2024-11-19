CC= gcc
GCC = -Wall -g 

TARGET = program
SRCDIR = src
OBJDIR= obj
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SOURCES))

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(GCC) -o $@ $(OBJECTS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(GCC) -c $< -o $@

$(OBJDIR): 
	mkdir -p $(OBJDIR)
clean: 
	rm -rf $(OBJDIR) $(TARGET)



