MODULES    := theories/Peano \
	\
	theories/Notations \
	theories/NotationsUtf8 \
	theories/Common \
	\
	theories/Category/Core \
	theories/Functor/Core \
	\
	theories/Category/Equality \
	theories/Category/Morphisms \
	theories/Category/UnivalentCategory \
	theories/Category/StrictCategory \
	theories/Category/Objects \
	theories/Category/Duals \
	theories/Category \
	\
	theories/Functor/Equality \
	theories/Functor/Identity \
	theories/Functor/Composition \
	theories/Functor/CompositionLaws \
	theories/Functor/Duals \
	theories/Functor \
	\
	theories/NaturalTransformation/Core \
	theories/NaturalTransformation/Equality \
	theories/NaturalTransformation/Identity \
	theories/NaturalTransformation/Composition \
	theories/NaturalTransformation/CompositionLaws \
	theories/NaturalTransformation/Duals \
	theories/NaturalTransformation \
	\
	theories/Category/Product \
	theories/Functor/Product \
	theories/NaturalTransformation/Product \
	\
	theories/SumPreCategory \
	\
	theories/SetCategory \
	\
	theories/ComputableCat \
	\
	theories/FunctorCategory \
	theories/FunctorCategory/Morphisms \
	\
	theories/NaturalTransformation/Isomorphisms \
	\
	theories/Groupoid \
	theories/Groupoid/Functors \
	theories/Groupoid/Duals \
	theories/DiscreteCategory \
	theories/Discrete/Duals \
	theories/IndiscreteCategory \
	theories/BoolCategory \
	theories/NatCategory \
	theories/NatCategory/Duals \
	\
	theories/InitialTerminalCategory \
	\
	theories/Cat \
	theories/Cat/Morphisms \
	\
	theories/Comma/CommaCategory \
	theories/Comma/Duals \
	theories/Comma/Projection \
	theories/Comma/InducedFunctors \
	\
	theories/UniversalProperties \
	\
	theories/IsGroupoid \
	\
	theories/Grothendieck/ToSet \
	theories/Grothendieck \
	\
	theories/NaturalNumbersObject \
	theories/Hom \
	\
	theories/Adjoint/UnitCounit \
	theories/Adjoint/UnitCounitCoercions \
	theories/Adjoint/Hom \
	theories/Adjoint \
	\
	theories/Utf8

VS         := $(MODULES:%=%.v)
VDS	   := $(MODULES:%=%.v.d)

NEW_TIME_FILE=time-of-build-after.log
OLD_TIME_FILE=time-of-build-before.log
BOTH_TIME_FILE=time-of-build-both.log
NEW_PRETTY_TIME_FILE=time-of-build-after-pretty.log
SINGLE_TIME_FILE=time-of-build.log
SINGLE_PRETTY_TIME_FILE=time-of-build-pretty.log
TIME_SHELF_NAME=time-of-build-shelf


HOQC=$(shell readlink -f ./HoTT/hoqc)


.PHONY: coq clean pretty-timed pretty-timed-files html HoTT

coq: Makefile.coq
	$(MAKE) -f Makefile.coq

html: Makefile.coq
	$(MAKE) -f Makefile.coq html

pretty-timed-diff:
	bash ./etc/make-each-time-file.sh "$(MAKE)" "$(NEW_TIME_FILE)" "$(OLD_TIME_FILE)"
	$(MAKE) combine-pretty-timed

combine-pretty-timed:
	python ./etc/make-both-time-files.py "$(NEW_TIME_FILE)" "$(OLD_TIME_FILE)" "$(BOTH_TIME_FILE)"
	cat "$(BOTH_TIME_FILE)"
	@echo

pretty-timed:
	bash ./etc/make-each-time-file.sh "$(MAKE)" "$(SINGLE_TIME_FILE)"
	python ./etc/make-one-time-file.py "$(SINGLE_TIME_FILE)" "$(SINGLE_PRETTY_TIME_FILE)"
	cat "$(SINGLE_PRETTY_TIME_FILE)"
	@echo

Makefile.coq: Makefile $(VS) HoTT
	coq_makefile COQC = "\$$(TIMER) \"$(HOQC)\"" $(VS) -arg -dont-load-proofs -o Makefile.coq -R HoTT/theories HoTT -R theories HoTT.Categories

HoTT/Makefile:
	cd HoTT; ./configure

HoTT: HoTT/Makefile
	cd HoTT; $(MAKE)

clean:: Makefile.coq
	$(MAKE) -f Makefile.coq clean
	rm -f Makefile.coq .depend
