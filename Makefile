DICT_NAME		=	Scottish Slang
DICT_SRC_PATH		=	ScottishSlang.xml
CSS_PATH		=	ScottishSlang.css
PLIST_PATH		=	ScottishSlang.plist
DICT_BUILD_OPTS		=

DICT_BUILD_TOOL_DIR	?=	$(HOME)/Library/Dictionary Development Kit
DICT_BUILD_TOOL_BIN	=	$(DICT_BUILD_TOOL_DIR)/bin

DICT_DEV_KIT_OBJ_DIR	=	./objects
export	DICT_DEV_KIT_OBJ_DIR
RM			=	/bin/rm

all:
	"$(DICT_BUILD_TOOL_BIN)/build_dict.sh" $(DICT_BUILD_OPTS) "$(DICT_NAME)" $(DICT_SRC_PATH) $(CSS_PATH) $(PLIST_PATH)
	echo "Done. Now run: bash patch_and_install.sh"

clean:
	$(RM) -rf $(DICT_DEV_KIT_OBJ_DIR)
