#! /usr/bin/make -f

all: compile-test

compile-test:
	perl -Mdiagnostics -w -c fakecloud
