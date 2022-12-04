.PHONY: deploy
deploy : book
	@echo "====> déploiement sur github"
	git worktree add /tmp/book gh-pages
	mdbook build
	rm -rf /tmp/book/*
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git update-ref -d refs/heads/gh-pages
		git add -A && \
		git commit -m "déployé le $(shell date) par ${USER}" && \
		git push origin gh-page
