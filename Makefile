TARGET = mytalks.pdf
SRC = list_src/list.md
CSL = list_src/mytalks.csl
BIB = csljson/mytalks.json

list : $(TARGET)

$(TARGET) : $(SRC) $(BIB) $(CSL)
	@pandoc -f markdown -t pdf --citeproc --bibliography=$(BIB) --csl=$(CSL) -o $@ $(SRC)

clean :
	@rm  $(TARGET)
