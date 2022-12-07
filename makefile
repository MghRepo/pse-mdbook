.PHONY: deploy
deploy : book
	@echo "====> nettoyage gh-pages remote"
	git push origin -d gh-pages
	@echo "====> nettoyage gh-pages local"
	rm -rf /tmp/book/* 
	git worktree remove --force /tmp/book
	@echo "====> préparation worktree"
	git branch -D gh-pages
	git worktree add -b gh-pages /tmp/book
	@echo "====> test et build"
	mdbook build
	@echo "====> copie worktree gh-pages puis déploiement sur github"
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git update-ref -d refs/heads/gh-pages && \
		git add -A && \
		git commit -m "déployé le $(shell date) par ${USER}" && \
		git push --force origin gh-pages
