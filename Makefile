install:
	sudo apt-get update &&\
		xargs -a requirements.txt sudo apt-get install

save-file:
	git config --local user.email "actions@github.com" &&\
		git config --local user.name "GitHub Actions" &&\
		git add --all &&\
		git commit -am "add data" &&\
		git push