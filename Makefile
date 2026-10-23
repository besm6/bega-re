.PHONY: demo check demo-bega check-bega solve-checkers kalah-book demo-jinn check-jinn inventory-jinn check-launchers

demo:
	python3 tools/check.py

check:
	python3 tools/check.py
	python3 tools/check-bega.py
	python3 tools/check-jinn.py
	python3 tools/check-launchers.py

demo-bega check-bega:
	python3 tools/check-bega.py

solve-checkers:
	python3 tools/solve-checkers.py

kalah-book:
	python3 tools/generate-kalah-book.py

demo-jinn check-jinn:
	python3 tools/check-jinn.py

inventory-jinn:
	python3 tools/inventory-jinn.py

check-launchers:
	python3 tools/check-launchers.py
