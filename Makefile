SECRETS_FILE=genedata/config/secrets.json

init: venv/bin/activate
venv/bin/activate: requirements.txt
	test -d proj_venv || virtualenv proj_venv
	source proj_venv/bin/activate; \
	proj_venv/bin/pip install -Ur requirements.txt; \

cli:
	pip install -e genedata/gene_interaction/; \
	mkdir cli; \
	ln -s genedata/gene_interaction/gene_interaction.egg-info cli; \
	pip install -e genedata/patient_info/; \
	ln -s genedata/patient_info/patient_info.egg-info cli; \
	pip install -e genedata/gene_info/; \
	ln -s genedata/gene_info/gene_info.egg-info cli; \
	pip install -e genedata/gene_stats/; \
	ln -s genedata/gene_stats/gene_stats.egg-info cli; \
