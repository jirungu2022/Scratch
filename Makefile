#  Components of a make file
#  targets: prerequisites
#  (targets == file names separated by spaces - typically one)
#  (prerequisites == file names (dependencies) separated by spaces)
#		 command (Series of steps used to make the target(s) - start w/tab)
#		 command (Series of steps used to make the target(s) - start w/tab)
#	 Variables can only be strings. Typically use :=, but = also works.
#  files := file1 file2
#  some_file := $(files)
#  Note: Single or double quotes have no meaning to Make.
#  $@ == automatic variable containing target name
files := Johnson.txt Irungu.txt

all: myName printName touchFile

myName printName touchFile:
	echo $@

myName: $(files)
	echo "My name is Johnson Irungu."
	echo "These lines will print if file myName does not exist."
	echo "Look at these variables: " $(files)
	touch myName

printName: printName.o
	cc printName.o -o printName	# 3rd

printName.o: printName.c
	cc -c printName.c -o printName.o # 2nd

printName.c:
	echo "int main(){return 0;}" > printName.c # 1st

touchFile:
	touch myFile

Johnson.txt:
	touch Johnson.txt
Irungu.txt:
	touch Irungu.txt

#  print: $(wildcard *.c)
#  Print out file info about every .c file

clean:
		rm -rf myName myFile Johnson.txt Irungu.txt printName*
