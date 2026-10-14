#!/usr/bin/env python3
"""Validate hub catalog data with stdlib checks and optional PyYAML validation."""
from __future__ import annotations
import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
errors: list[str] = []

try:
    dataset = json.loads((ROOT / "catalog/dataset.json").read_text(encoding="utf-8"))
    assert dataset.get("schema_version") == 1
    assert isinstance(dataset.get("records"), list)
    all_records = list(dataset["records"])
    for relative_path in dataset.get("domain_files", []):
        domain_path = ROOT / "catalog" / relative_path
        domain_data = json.loads(domain_path.read_text(encoding="utf-8"))
        if domain_data.get("schema_version") != 1 or not isinstance(domain_data.get("records"), list):
            errors.append(f"{domain_path.relative_to(ROOT)}: invalid schema_version or records")
            continue
        all_records.extend(domain_data["records"])
    ids = [record.get("id") for record in all_records]
    if any(not record_id for record_id in ids):
        errors.append("catalog: every record must have an id")
    if len(ids) != len(set(ids)):
        errors.append("catalog: duplicate record IDs across registered datasets")
except Exception as exc:
    errors.append(f"catalog/dataset.json: {exc}")

try:
    taxonomy_path = ROOT / "taxonomy/domains.yaml"
    yaml = __import__("yaml")
    taxonomy = yaml.safe_load(taxonomy_path.read_text(encoding="utf-8"))
    areas = taxonomy.get("areas", [])
    domain_ids = [area.get("id") for area in areas]
    if len(domain_ids) != len(set(domain_ids)):
        errors.append("taxonomy/domains.yaml: duplicate domain IDs")
except ModuleNotFoundError:
    print("NOTE: PyYAML unavailable; YAML syntax and card validation skipped.")
except Exception as exc:
    errors.append(f"taxonomy/domains.yaml: {exc}")

try:
    yaml = __import__("yaml")
    for path in sorted((ROOT / "catalog").glob("**/*.yaml")):
        try:
            card = yaml.safe_load(path.read_text(encoding="utf-8"))
            if not isinstance(card, dict) or not card.get("id") or not card.get("canonical_url"):
                errors.append(f"{path.relative_to(ROOT)}: requires id and canonical_url")
        except Exception as exc:
            errors.append(f"{path.relative_to(ROOT)}: {exc}")
except ModuleNotFoundError:
    pass

if errors:
    print("Catalog validation failed:")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)
print("Catalog validation passed (JSON checked; YAML checks run only if PyYAML is installed).")
