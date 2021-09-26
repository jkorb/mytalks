TARGET = mytalks.pdf
SRC_DIR = pdf_src
MD = $(SRC_DIR)/mytalks_src.md
TEMPLATE = $(SRC_DIR)/template.tex
CSL = $(SRC_DIR)/mytalks.csl
BIB = csljson/mytalks.json

list : $(TARGET)

$(TARGET) : $(SRC) $(BIB) $(CSL)
	@pandoc -f markdown -t pdf --citeproc --bibliography=$(BIB) --csl=$(CSL) -o $@ --template=$(TEMPLATE) $(MD)

clean :
	@rm  $(TARGET)
