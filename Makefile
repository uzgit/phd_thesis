all:
	$(MAKE) -C src all
	mv out/*.pdf .
	rm -rf out

build_only:
	$(MAKE) -C src all

epub: build_only
	rm -rf ./epub
	cp -r ./src ./epub
	cp -r ./out ./epub
	cd ./epub && mk4ht htlatex ./main.tex 'xhtml,charset=utf-8,pmathml' ' -cunihtf -utf8 -cvalidate'
	ebook-convert ./epub/main.html ./output.epub
	cd ..

clean:
	$(MAKE) -C src clean
