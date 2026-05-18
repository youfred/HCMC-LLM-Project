# Project Structure Notes

This repository was merged from two folders:

1. `HCMC-LLM-Project-main`: original project repository containing preprocessing notebooks, main Streamlit app, recall analysis, images, and requirements.
2. `2024캡스톤현대차`: later capstone/portfolio implementation containing additional Streamlit apps, vector DB creation scripts, processed JSON/JSONL files, and image assets.

The merged repository keeps both sets of work while reorganizing them into a GitHub-friendly structure.

- Use `app/rag_streamlit.py` as the main app entry point.
- Use `app/carbotapp.py` or `app/pc_agentRag.py` to show agent-style RAG experiments.
- Use `data_processing/` to show the preprocessing workflow.
- Use `data/processed/` to show processed regulation data.
- Use `docs/presentation.pptx` as supporting presentation material.
