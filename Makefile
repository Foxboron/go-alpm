include $(GOROOT)/src/Make.inc

TARG=github.com/remyoudompheng/go-alpm
CGOFILES=alpm.go\
	 options.go\
	 error.go\
	 list.go\
	 db.go\
	 package.go\
	 types.go

GOFILES=defs.go\
	enums.go

include $(GOROOT)/src/Make.pkg

defs.go: defs.c
	godefs -g alpm $< | sed s/ALPM_// | gofmt > $@

examples:
	gomake -C examples

format:
	gofmt -l -s -w *.go
