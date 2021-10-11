#-----------------------------------------------------
# Some usefull instructions...
#
DOC = ./gen.sh
#-----------------------------------------------------

all: docs/modules/ROOT/pages/master.html 

# main.adoc: main-template.adoc $(BOOKS)
# 	mvn asciidoc-template::build

docs/modules/ROOT/pages/master.html: docs/modules/ROOT/pages/master.adoc playbook.yml 
	$(DOC)

clean:
	rm *.html

init:
	npm i asciidoctor asciidoctor-kroki
	
check:
	cucumber

deploy: build/site/index.html 
	@echo "========================================"
	@echo "==> Deploy updates "
	git commit -am "🤖 DEPLOY: last updates"; git pull; git push