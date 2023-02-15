.DEFAULT_GOAL := run
API_PATH := ${PORT}/api/v1/referees

db-start:
	psql -U ${DB_USERNAME} -d postgres -a -f ops/sql/start.sql

db-clean:
	psql -U ${DB_USERNAME} -d postgres -a -f ops/sql/clean.sql

system:
	guix shell --pure --container

api-new:
	http post :${API_PATH} name='Paulo Cesar' state='DF'

api-all:
	http get :${API_PATH}

api-one:
	http get :${API_PATH}/4

api-delete:
	http delete :${API_PATH}/2

.PHONY := db-start db-clean system api-new api-delete api-all api-one
