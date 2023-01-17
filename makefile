tmpbookdir=/tmp/pse-book/

.PHONY: deploy
deploy : book
	./.deploy ${tmpbookdir}
