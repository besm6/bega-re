.PHONY: demo check demo-bega check-bega solve-checkers

demo:
	python3 tools/check.py

check:
	python3 tools/check.py
	python3 tools/check-bega.py

demo-bega check-bega:
	python3 tools/check-bega.py

solve-checkers:
	python3 tools/solve-checkers.py
