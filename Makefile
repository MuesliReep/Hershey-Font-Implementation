#Windows makefile

CC = mingw32-gcc

###
###  CFLAGS
###

CFLAGS  = -std=c99

CFLAGS += -ID:/_libs/opencv/build/include


###
###  Libs
###

LIBS  = -LD:/_libs/opencv/build/x86/mingw/lib
LIBS += -lm
LIBS += -lopencv_core243 -lopencv_imgproc243 -lopencv_highgui243
#LIBS += -lcv -lhighgui

###
###  Dirs & Files
###

SRCDIR = src
BLDDIR = bld
#MKBLDDIR = @mkdir $(BLDDIR)
BIN  = Hershey.exe
ALLTARGETS = Hershey-Imp

SRC_FILES  = main.c
SRC_FILES += Output.c
SRC_FILES += Graphics.c


ifndef V
  QUIET_CC   = @echo ' CC   ' $<;
  QUIET_LINK = @echo ' LINK ' $@;
  QUIET_TEST = >/dev/null 2>&1
endif

SRC  := $(patsubst %,$(SRCDIR)/%,$(SRC_FILES))
SRC  := $(sort $(SRC))
OBJ  := $(patsubst $(SRCDIR)/%.c,$(BLDDIR)/%.o,$(SRC))
DEPS := $(patsubst $(SRCDIR)/%.c,$(BLDDIR)/%.d,$(SRC))

$(BLDDIR)/%.o: $(SRCDIR)/%.c
	$(MKBLDDIR)
	$(QUIET_CC)$(CC) $(CFLAGS) -c $< -o $@

Hershey-Imp: $(OBJ)
	$(QUIET_LINK)$(CC) $(LDOPTS) -o $(BIN) $(OBJ) $(LIBS)

# do not move the following line:
-include $(DEPS)

###
###  Common
###

all: $(ALLTARGETS)

clean:
	rm -f $(ALLTARGETS) *~ gmon*
	rm -rf $(BLDDIR)
