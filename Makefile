BIN_DIR=./bin
OBJECT_DIR=./tmp
SRC_DIR=./src

PROGRAM_NAME=game_of_life
PROGRAM_PATH=$(BIN_DIR)/$(PROGRAM_NAME)

GNATMAKE=/usr/local/gnat/bin/gnatmake
GNATMAKE_OPTS=-I$(SRC_DIR) -D $(OBJECT_DIR)

all: prepare $(PROGRAM_PATH)

prepare:
	mkdir -p $(BIN_DIR) $(OBJECT_DIR)

$(PROGRAM_PATH): $(SRC_DIR)/*.ads $(SRC_DIR)/*.adb
	$(GNATMAKE) $(GNATMAKE_OPTS) -o $(PROGRAM_PATH) main

clean:
	rm -rf $(BIN_DIR) $(OBJECT_DIR)
