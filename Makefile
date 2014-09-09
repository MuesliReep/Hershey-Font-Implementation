

CC = gcc

###
###  CFLAGS
###

CFLAGS  = -std=c99

CFLAGS += -ID:/_libs/opencv/include


###
###  Libs
###

LIBS  = -LD:/_libs/opencv/build/x86/mingw/lib
LIBS += -lm
LIBS += -lopencv_core -lopencv_imgproc -lopencv_highgui
#LIBS += -lcv -lhighgui

###
###  Dirs & Files
###

SRCDIR = src
BLDDIR = bld
MKBLDDIR = @mkdir -p $(BLDDIR)
BIN  = OSD-Tester
ALLTARGETS = OSD-Tester

SRC_FILES  = main.c
SRC_FILES += output.c
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

OSD-Tester: $(OBJ)
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
