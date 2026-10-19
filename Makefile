DB = vendas.db

.PHONY: all build clean query

all: build

build: $(DB)

$(DB): schema.sql views.sql seed.sql
	rm -f $(DB)
	sqlite3 $(DB) < schema.sql
	sqlite3 $(DB) < views.sql
	sqlite3 $(DB) < seed.sql
	@echo "✅ Banco criado: $(DB)"

query:
	@read -p "Arquivo de query: " q; \
	sqlite3 -column -header $(DB) < $$q

clean:
	rm -f $(DB)